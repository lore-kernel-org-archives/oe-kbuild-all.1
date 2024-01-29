Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D654D112
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Jan 2024 09:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706521458; cv=none; b=EGlO2vkcWiYqPK6oHI+y5NaqPtGtrE9nVX/raorBw5xJR16JXai976ufG/Ai9b7iGKhfbMW6p0Wa5LPH42MkstMsjJ6RtGs7I75UvQ8yBuL3If+FBruG06BFAGnmOz1UKS+FQC9tKfF/RAdHrQQa6qSjD/0gFQDKfkpm6vbmNgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706521458; c=relaxed/simple;
	bh=wcLX45ap6JhBH76WE2IP/GivS77N1OTn8dNrZ+0jdQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CY5kidTO7TleYsoWW5Gs1ykuUpX59K+DeNHeg7Yg+17ga35NpLwstCBLT/YMb1uzyVgWVZ8JLrCCMuV4wh3CmsBNBRy5nf4cE3MC84JPxSBvjDE6vA7GqShQCEa6gAS+4xW/WxJrb72r5oUGGc68g5VFhZeQNupN85TiazDxLnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D8Y4bjJA; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D8Y4bjJA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706521457; x=1738057457;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wcLX45ap6JhBH76WE2IP/GivS77N1OTn8dNrZ+0jdQQ=;
  b=D8Y4bjJAv98GGrP7DzxkzbWY7kXL/bl3iPTvKnI+gjXqJwlX8LYGp6o6
   VtV5WEbWdpNztsaEX5P+4kpjETM7T/WydhYO4ocfA/LESBXs1RwFqoWQU
   NWtez3MH1cUxjpXEwrVG8ANzegazjYy0j6timTqNxONZf7mnYk8jGiw7w
   AGcgWZt1rm8j0wCyKOWwio+CJnQmMK7HPWROGjEWOQRnyHKDCfQAwXiNK
   qMk/yYY92b89YcJPzmmHZLNJHWLiOrmyzSsrY4NcajcEd2LXQHvnxGXLK
   FUteee84kycNVRj4/gtxjpFYxrHxN3pgLZNLr1gPRdasz6YjcaEuWKrij
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="2732986"
X-IronPort-AV: E=Sophos;i="6.05,226,1701158400"; 
   d="scan'208";a="2732986"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2024 01:44:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="858043827"
X-IronPort-AV: E=Sophos;i="6.05,226,1701158400"; 
   d="scan'208";a="858043827"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 29 Jan 2024 01:44:14 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUOBY-0004Cm-25;
	Mon, 29 Jan 2024 09:44:12 +0000
Date: Mon, 29 Jan 2024 17:43:35 +0800
From: kernel test robot <lkp@intel.com>
To: NeilBrown <neilb@suse.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 06/13] nfsd: prepare for supporting admin-revocation of
 state
Message-ID: <202401291701.KnnRi3sK-lkp@intel.com>
References: <20240129033637.2133-7-neilb@suse.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240129033637.2133-7-neilb@suse.de>

Hi NeilBrown,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.8-rc2]
[cannot apply to hch-configfs/for-next next-20240129]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/NeilBrown/nfsd-remove-stale-comment-in-nfs4_show_deleg/20240129-113847
base:   linus/master
patch link:    https://lore.kernel.org/r/20240129033637.2133-7-neilb%40suse.de
patch subject: [PATCH 06/13] nfsd: prepare for supporting admin-revocation of state
config: s390-defconfig (https://download.01.org/0day-ci/archive/20240129/202401291701.KnnRi3sK-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240129/202401291701.KnnRi3sK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401291701.KnnRi3sK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/nfsd/nfs4state.c:1715: warning: Function parameter or struct member 'net' not described in 'nfsd4_revoke_states'
>> fs/nfsd/nfs4state.c:1715: warning: Function parameter or struct member 'sb' not described in 'nfsd4_revoke_states'


vim +1715 fs/nfsd/nfs4state.c

  1699	
  1700	/**
  1701	 * nfsd4_revoke_states - revoke all nfsv4 states associated with given filesystem
  1702	 * @net - used to identify instance of nfsd (there is one per net namespace)
  1703	 * @sb - super_block used to identify target filesystem
  1704	 *
  1705	 * All nfs4 states (open, lock, delegation, layout) held by the server instance
  1706	 * and associated with a file on the given filesystem will be revoked resulting
  1707	 * in any files being closed and so all references from nfsd to the filesystem
  1708	 * being released.  Thus nfsd will no longer prevent the filesystem from being
  1709	 * unmounted.
  1710	 *
  1711	 * The clients which own the states will subsequently being notified that the
  1712	 * states have been "admin-revoked".
  1713	 */
  1714	void nfsd4_revoke_states(struct net *net, struct super_block *sb)
> 1715	{
  1716		struct nfsd_net *nn = net_generic(net, nfsd_net_id);
  1717		unsigned int idhashval;
  1718		unsigned int sc_types;
  1719	
  1720		sc_types = 0;
  1721	
  1722		spin_lock(&nn->client_lock);
  1723		for (idhashval = 0; idhashval < CLIENT_HASH_MASK; idhashval++) {
  1724			struct list_head *head = &nn->conf_id_hashtbl[idhashval];
  1725			struct nfs4_client *clp;
  1726		retry:
  1727			list_for_each_entry(clp, head, cl_idhash) {
  1728				struct nfs4_stid *stid = find_one_sb_stid(clp, sb,
  1729									  sc_types);
  1730				if (stid) {
  1731					spin_unlock(&nn->client_lock);
  1732					switch (stid->sc_type) {
  1733					}
  1734					nfs4_put_stid(stid);
  1735					spin_lock(&nn->client_lock);
  1736					goto retry;
  1737				}
  1738			}
  1739		}
  1740		spin_unlock(&nn->client_lock);
  1741	}
  1742	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
