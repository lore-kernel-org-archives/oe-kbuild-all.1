Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D47B369
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Sep 2023 01:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694655488; x=1726191488;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d5i4xO2ELA1Pe8xiN4vp8E2EVzwEgrhRsDYOA3hrPxI=;
  b=HqOD02bL6MeNXCAj7J2pCLSF4HSwAK/FH33UK18cTbXgZ1v1ltl9tJP+
   cc5FMOmv7NUccro4XNbkTdPQQrIoPl5/QO24qENhNTJoGoUQJRHlFrnun
   Sj7GSJeukNl7C62CCyLErp9jW584SUe0yKcdycPNVFNIh6xAPZwmeu8G6
   Ibfr0jXIMh95Ew09SZcg+zIxK/Qv1MFgGRZ0JuDvC1bFWljvlintNK02V
   3HrDQKBZe7lZvaA2+RijtxDmWb7SpU5ZZSMR0luEzGqIFyuoPmaISBvuf
   CCr5k43E8AEj5ou01oX5U1xOijkUuBeyPa8Cq9kFs1Mk8L5m6kV5JZrAq
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="377735358"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; 
   d="scan'208";a="377735358"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 18:38:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="694053169"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; 
   d="scan'208";a="694053169"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 13 Sep 2023 18:38:05 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgbIw-0000wf-2T;
	Thu, 14 Sep 2023 01:38:03 +0000
Date: Thu, 14 Sep 2023 09:37:22 +0800
From: kernel test robot <lkp@intel.com>
To: Song Liu <song@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [song:test-bpf-tramp-to-prog-pack 5/5]
 kernel/bpf/trampoline.c:365:15: warning: unused variable 'image'
Message-ID: <202309140926.bup0Urm0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/song/linux.git test-bpf-tramp-to-prog-pack
head:   2e429f41922fabd2a64862c11b90056abf7ce9c1
commit: 2e429f41922fabd2a64862c11b90056abf7ce9c1 [5/5] bpf: Allocate image in arch_prepare_bpf_trampoline()
config: s390-defconfig (https://download.01.org/0day-ci/archive/20230914/202309140926.bup0Urm0-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230914/202309140926.bup0Urm0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309140926.bup0Urm0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf/trampoline.c: In function 'bpf_tramp_image_alloc':
>> kernel/bpf/trampoline.c:365:15: warning: unused variable 'image' [-Wunused-variable]
     365 |         void *image;
         |               ^~~~~


vim +/image +365 kernel/bpf/trampoline.c

29949b46ac1de7 Song Liu           2023-09-13  361  
29949b46ac1de7 Song Liu           2023-09-13  362  static struct bpf_tramp_image *bpf_tramp_image_alloc(void)
29949b46ac1de7 Song Liu           2023-09-13  363  {
29949b46ac1de7 Song Liu           2023-09-13  364  	struct bpf_tramp_image *im;
e21aa341785c67 Alexei Starovoitov 2021-03-16 @365  	void *image;
2e429f41922fab Song Liu           2023-09-13  366  	int err;
e21aa341785c67 Alexei Starovoitov 2021-03-16  367  
e21aa341785c67 Alexei Starovoitov 2021-03-16  368  	im = kzalloc(sizeof(*im), GFP_KERNEL);
e21aa341785c67 Alexei Starovoitov 2021-03-16  369  	if (!im)
2e429f41922fab Song Liu           2023-09-13  370  		return ERR_PTR(-ENOMEM);
e21aa341785c67 Alexei Starovoitov 2021-03-16  371  
e21aa341785c67 Alexei Starovoitov 2021-03-16  372  	err = percpu_ref_init(&im->pcref, __bpf_tramp_image_release, 0, GFP_KERNEL);
e21aa341785c67 Alexei Starovoitov 2021-03-16  373  	if (err)
2e429f41922fab Song Liu           2023-09-13  374  		goto out_free_im;
e21aa341785c67 Alexei Starovoitov 2021-03-16  375  	return im;
e21aa341785c67 Alexei Starovoitov 2021-03-16  376  
e21aa341785c67 Alexei Starovoitov 2021-03-16  377  out_free_im:
e21aa341785c67 Alexei Starovoitov 2021-03-16  378  	kfree(im);
e21aa341785c67 Alexei Starovoitov 2021-03-16  379  	return ERR_PTR(err);
e21aa341785c67 Alexei Starovoitov 2021-03-16  380  }
e21aa341785c67 Alexei Starovoitov 2021-03-16  381  

:::::: The code at line 365 was first introduced by commit
:::::: e21aa341785c679dd409c8cb71f864c00fe6c463 bpf: Fix fexit trampoline.

:::::: TO: Alexei Starovoitov <ast@kernel.org>
:::::: CC: Daniel Borkmann <daniel@iogearbox.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
