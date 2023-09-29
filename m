Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6776F15ADB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Sep 2023 10:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695983465; x=1727519465;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cJL8ueWuCjgHjD1foN++iV6srjQt5o/jr0dESBTCY6U=;
  b=DDCvFDRVYuTtvdSwyNtT4+bbYswRdBW2nTjcBeN4BrPl00mp4LA1sNbv
   4nxBW9WGaxWI03+or6+IP7PIkNOC4h+EieddRNRmVtf1zdhmBSLRM8poM
   OLafBqDfW/R1Lb/TAmgLdC2dpyFWAuMwNaw94LkvszClIkJKqNhotrDyE
   sMnGIBXmKgw2guKkfQrm8DuaDnQ312/mQ7eARWUU1FO7alhUz6yPRI/Mx
   jnAZ4JoWtwXoqStEsQik+mmVJCu+oXWF28tjxTyp39pXhbtiNJ8pazn2C
   yg1bOno2ve6shSE0/qEus4UuGIX1/RK7cfG/v12itwLNIzSCY0+0UvnKL
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="386135527"
X-IronPort-AV: E=Sophos;i="6.03,187,1694761200"; 
   d="scan'208";a="386135527"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2023 03:31:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="820177722"
X-IronPort-AV: E=Sophos;i="6.03,187,1694761200"; 
   d="scan'208";a="820177722"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 29 Sep 2023 03:31:00 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qmAlt-0002k1-2z;
	Fri, 29 Sep 2023 10:30:57 +0000
Date: Fri, 29 Sep 2023 18:30:02 +0800
From: kernel test robot <lkp@intel.com>
To: Costa Shulyupin <costa.shul@redhat.com>,
	Mike Kravetz <mike.kravetz@oracle.com>,
	Muchun Song <muchun.song@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>, linux-mm@kvack.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Costa Shulyupin <costa.shul@redhat.com>
Subject: Re: [PATCH] docs: update link to powerpc/vmemmap_dedup.rst
Message-ID: <202309291832.6j4oF2eE-lkp@intel.com>
References: <20230927164319.2686237-1-costa.shul@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230927164319.2686237-1-costa.shul@redhat.com>

Hi Costa,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lwn/docs-next]
[also build test WARNING on linus/master v6.6-rc3 next-20230929]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Costa-Shulyupin/docs-update-link-to-powerpc-vmemmap_dedup-rst/20230928-004508
base:   git://git.lwn.net/linux.git docs-next
patch link:    https://lore.kernel.org/r/20230927164319.2686237-1-costa.shul%40redhat.com
patch subject: [PATCH] docs: update link to powerpc/vmemmap_dedup.rst
reproduce: (https://download.01.org/0day-ci/archive/20230929/202309291832.6j4oF2eE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309291832.6j4oF2eE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: Documentation/mm/vmemmap_dedup.rst references a file that doesn't exist: Documentation/arch/powerpc/vmemmap_dedup.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
