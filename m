Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57F31F95F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Sep 2023 17:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694626078; x=1726162078;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=upza/+kwgrNBnoqU1zeEKAr4jHGFHkccZQ/AL0V26DI=;
  b=FXVXa6Advx14d2OXwCaxYq7sROmZs3PKwAUp1cC3PkuagEYIp8IVS4lV
   ZUqvUW/wmFp2FtZpc00FGjxOdmVBuh7gQLqqFSLFhwREIqaCt3TauTkHK
   Bw5elZL8uU25lZ5A2tpjZmfeVnxgp11CNuT6Lr7D3U+ligJTre3uatDkg
   9SMQAYVczhenOXp+VRG4X/HRwoWPIFuBMGuCBrK2/uMoQynKstDGQDp2X
   yeab0AMUXTBpvX4Ps42lMQsq4Em8Cg9fN8eVi6hINcYy5dUp5VZbNH6mu
   HR24YU0DZE/FdMynM5pIJGVxDHSvizvxoJRUCaxjPyyyn+YBZyOXzrDD1
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="445165784"
X-IronPort-AV: E=Sophos;i="6.02,143,1688454000"; 
   d="scan'208";a="445165784"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 10:27:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="859348443"
X-IronPort-AV: E=Sophos;i="6.02,143,1688454000"; 
   d="scan'208";a="859348443"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 13 Sep 2023 10:27:54 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgTeZ-0000Oz-0P;
	Wed, 13 Sep 2023 17:27:51 +0000
Date: Thu, 14 Sep 2023 01:27:26 +0800
From: kernel test robot <lkp@intel.com>
To: Dai Ngo <dai.ngo@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/2] NFSD: handle GETATTR conflict with write delegation
Message-ID: <202309140122.zQJDT1jd-lkp@intel.com>
References: <1694617319-27455-3-git-send-email-dai.ngo@oracle.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1694617319-27455-3-git-send-email-dai.ngo@oracle.com>

Hi Dai,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.6-rc1 next-20230913]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dai-Ngo/NFSD-add-supports-for-CB_GETATTR-callback/20230913-230417
base:   linus/master
patch link:    https://lore.kernel.org/r/1694617319-27455-3-git-send-email-dai.ngo%40oracle.com
patch subject: [PATCH 2/2] NFSD: handle GETATTR conflict with write delegation
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230914/202309140122.zQJDT1jd-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230914/202309140122.zQJDT1jd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309140122.zQJDT1jd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/nfsd/nfs4state.c:8484: warning: Function parameter or member 'modified' not described in 'nfsd4_deleg_getattr_conflict'
>> fs/nfsd/nfs4state.c:8484: warning: Function parameter or member 'size' not described in 'nfsd4_deleg_getattr_conflict'


vim +8484 fs/nfsd/nfs4state.c

fd19ca36fd782b Dai Ngo 2023-06-29  8465  
fd19ca36fd782b Dai Ngo 2023-06-29  8466  /**
fd19ca36fd782b Dai Ngo 2023-06-29  8467   * nfsd4_deleg_getattr_conflict - Recall if GETATTR causes conflict
fd19ca36fd782b Dai Ngo 2023-06-29  8468   * @rqstp: RPC transaction context
fd19ca36fd782b Dai Ngo 2023-06-29  8469   * @inode: file to be checked for a conflict
fd19ca36fd782b Dai Ngo 2023-06-29  8470   *
fd19ca36fd782b Dai Ngo 2023-06-29  8471   * This function is called when there is a conflict between a write
fd19ca36fd782b Dai Ngo 2023-06-29  8472   * delegation and a change/size GETATTR from another client. The server
fd19ca36fd782b Dai Ngo 2023-06-29  8473   * must either use the CB_GETATTR to get the current values of the
fd19ca36fd782b Dai Ngo 2023-06-29  8474   * attributes from the client that holds the delegation or recall the
fd19ca36fd782b Dai Ngo 2023-06-29  8475   * delegation before replying to the GETATTR. See RFC 8881 section
fd19ca36fd782b Dai Ngo 2023-06-29  8476   * 18.7.4.
fd19ca36fd782b Dai Ngo 2023-06-29  8477   *
fd19ca36fd782b Dai Ngo 2023-06-29  8478   * Returns 0 if there is no conflict; otherwise an nfs_stat
fd19ca36fd782b Dai Ngo 2023-06-29  8479   * code is returned.
fd19ca36fd782b Dai Ngo 2023-06-29  8480   */
fd19ca36fd782b Dai Ngo 2023-06-29  8481  __be32
d5906df88febf0 Dai Ngo 2023-09-13  8482  nfsd4_deleg_getattr_conflict(struct svc_rqst *rqstp, struct inode *inode,
d5906df88febf0 Dai Ngo 2023-09-13  8483  				bool *modified, u64 *size)
fd19ca36fd782b Dai Ngo 2023-06-29 @8484  {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
