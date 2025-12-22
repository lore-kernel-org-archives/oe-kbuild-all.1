Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 767D92D0C80
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 16:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766419767; cv=none; b=Ti6W4jd1q5K8KL9c7TnvRONA9R7cYooJT3xmxyBFu9xzq3E9hZO6MfDbk8uDC3q3G2QhScEHpYtsX8gPfx4qhti0wu/nfyX3kpUGp3xzVF2YPhFZymX2Wcn//8EE2JUBmFfu6D/t9P2aXaIwI0DRfvy2UfydGUlrDHmDbqLFpDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766419767; c=relaxed/simple;
	bh=A0N/Rh49nGuoa1n32EW3k7D8BgtSj1Yqc0j7pIjvbrs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=XGyo+MRmzXj+n6agb6phD4PMewSxCGBvgvnDqE7sPJIQ/z/DuLaT9VBgfn9utkEFuCiBgFg1MipkbrAkmiZYsCczvr7SYYlotZqGyF/rN0fB/KzvoIwvBFiAjQ55yBP2zF+deIDt6beHpzPmk+ZZpJafN5kznCbBy7ceVYnzEps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TEMjEV30; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TEMjEV30"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766419763; x=1797955763;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=A0N/Rh49nGuoa1n32EW3k7D8BgtSj1Yqc0j7pIjvbrs=;
  b=TEMjEV30Es6mA+Yd94Se9J5zhxfAtdKiZPRf5XTKSVQ2IsFIMylzwpEx
   1YdzmsaPr7uM+3UQ8zRYven8BkmBj/t+Swi0PJueU5/b7J2LLEPT2u3YZ
   pEUAdvTvjq2teABObIkyWGKUuVbZAaDpid6c9Wqs2MLg3D8NScf8xADwV
   bSF/OsGT0Nuai67EGvcnxrySKdaTjTqFrqoPlvmHCTNRp16NcUfXukKJF
   CsRESeZu/fYr40wD4P5Hkqf6DR9uRxhNCLxCUgoX0Y2AzPb+lHIfsXP78
   UaYvvzuZlpcQ4Xjw8Mt+twRFpo+AwQAYKDElWPP2gBJFv8AQPhXXaGbPo
   Q==;
X-CSE-ConnectionGUID: TSbxkyxlTDO1NtE5cv1V5A==
X-CSE-MsgGUID: v+ZHmxBPQXGYPODG9HM41g==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="79729052"
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="79729052"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 08:09:21 -0800
X-CSE-ConnectionGUID: +E7WPRzyQxKXGFK6FYquMg==
X-CSE-MsgGUID: +PqcwmCqQ5W3H3MFvdZhuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="199470819"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 22 Dec 2025 08:09:19 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXiTE-000000000nb-2rdm;
	Mon, 22 Dec 2025 16:09:16 +0000
Date: Tue, 23 Dec 2025 00:08:36 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1941/1941]
 drivers/tee/optee/core.c:618:10: warning: return makes integer from pointer
 without a cast
Message-ID: <202512230051.P5z9Xtje-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Ard,

First bad commit (maybe !=3D root cause):

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   4e9c55920995d70b3e88b60c69753df54b03fdf4
commit: 595311cf7e49c781dd26782e4b45fd54bbfb3e40 [1941/1941] optee: model O=
P-TEE as a platform device/driver
config: arm64-randconfig-003-20251212 (https://download.01.org/0day-ci/arch=
ive/20251223/202512230051.P5z9Xtje-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20251223/202512230051.P5z9Xtje-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512230051.P5z9Xtje-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

   drivers/tee/optee/core.c: In function 'optee_probe':
>> drivers/tee/optee/core.c:618:10: warning: return makes integer from poin=
ter without a cast [-Wint-conversion]
      return ERR_PTR(-EINVAL);
             ^~~~~~~~~~~~~~~~


vim +618 drivers/tee/optee/core.c

595311cf7e49c7 Ard Biesheuvel    2019-12-09  581 =20
595311cf7e49c7 Ard Biesheuvel    2019-12-09  582  static int optee_probe(st=
ruct platform_device *pdev)
4fb0a5eb364d23 Jens Wiklander    2015-04-14  583  {
4fb0a5eb364d23 Jens Wiklander    2015-04-14  584  	optee_invoke_fn *invoke_=
fn;
4fb0a5eb364d23 Jens Wiklander    2015-04-14  585  	struct tee_shm_pool *poo=
l;
4fb0a5eb364d23 Jens Wiklander    2015-04-14  586  	struct optee *optee =3D =
NULL;
4fb0a5eb364d23 Jens Wiklander    2015-04-14  587  	void *memremaped_shm =3D =
NULL;
4fb0a5eb364d23 Jens Wiklander    2015-04-14  588  	struct tee_device *teede=
v;
4fb0a5eb364d23 Jens Wiklander    2015-04-14  589  	u32 sec_caps;
4fb0a5eb364d23 Jens Wiklander    2015-04-14  590  	int rc;
4fb0a5eb364d23 Jens Wiklander    2015-04-14  591 =20
595311cf7e49c7 Ard Biesheuvel    2019-12-09  592  	invoke_fn =3D get_invoke=
_func(&pdev->dev);
4fb0a5eb364d23 Jens Wiklander    2015-04-14  593  	if (IS_ERR(invoke_fn))
595311cf7e49c7 Ard Biesheuvel    2019-12-09  594  		return PTR_ERR(invoke_f=
n);
4fb0a5eb364d23 Jens Wiklander    2015-04-14  595 =20
4fb0a5eb364d23 Jens Wiklander    2015-04-14  596  	if (!optee_msg_api_uid_i=
s_optee_api(invoke_fn)) {
4fb0a5eb364d23 Jens Wiklander    2015-04-14  597  		pr_warn("api uid mismat=
ch\n");
595311cf7e49c7 Ard Biesheuvel    2019-12-09  598  		return -EINVAL;
4fb0a5eb364d23 Jens Wiklander    2015-04-14  599  	}
4fb0a5eb364d23 Jens Wiklander    2015-04-14  600 =20
5c5f80307ab27c J=C3=A9r=C3=B4me Forissier  2017-11-24  601  	optee_msg_get_=
os_revision(invoke_fn);
5c5f80307ab27c J=C3=A9r=C3=B4me Forissier  2017-11-24  602 =20
4fb0a5eb364d23 Jens Wiklander    2015-04-14  603  	if (!optee_msg_api_revis=
ion_is_compatible(invoke_fn)) {
4fb0a5eb364d23 Jens Wiklander    2015-04-14  604  		pr_warn("api revision m=
ismatch\n");
595311cf7e49c7 Ard Biesheuvel    2019-12-09  605  		return -EINVAL;
4fb0a5eb364d23 Jens Wiklander    2015-04-14  606  	}
4fb0a5eb364d23 Jens Wiklander    2015-04-14  607 =20
4fb0a5eb364d23 Jens Wiklander    2015-04-14  608  	if (!optee_msg_exchange_=
capabilities(invoke_fn, &sec_caps)) {
4fb0a5eb364d23 Jens Wiklander    2015-04-14  609  		pr_warn("capabilities m=
ismatch\n");
595311cf7e49c7 Ard Biesheuvel    2019-12-09  610  		return -EINVAL;
4fb0a5eb364d23 Jens Wiklander    2015-04-14  611  	}
4fb0a5eb364d23 Jens Wiklander    2015-04-14  612 =20
4fb0a5eb364d23 Jens Wiklander    2015-04-14  613  	/*
4fb0a5eb364d23 Jens Wiklander    2015-04-14  614  	 * We have no other opti=
on for shared memory, if secure world
4fb0a5eb364d23 Jens Wiklander    2015-04-14  615  	 * doesn't have any rese=
rved memory we can use we can't continue.
4fb0a5eb364d23 Jens Wiklander    2015-04-14  616  	 */
4fb0a5eb364d23 Jens Wiklander    2015-04-14  617  	if (!(sec_caps & OPTEE_S=
MC_SEC_CAP_HAVE_RESERVED_SHM))
4fb0a5eb364d23 Jens Wiklander    2015-04-14 @618  		return ERR_PTR(-EINVAL);
4fb0a5eb364d23 Jens Wiklander    2015-04-14  619 =20
f58e236c9d665a Volodymyr Babchuk 2017-11-29  620  	pool =3D optee_config_sh=
m_memremap(invoke_fn, &memremaped_shm, sec_caps);
4fb0a5eb364d23 Jens Wiklander    2015-04-14  621  	if (IS_ERR(pool))
595311cf7e49c7 Ard Biesheuvel    2019-12-09  622  		return PTR_ERR(pool);
4fb0a5eb364d23 Jens Wiklander    2015-04-14  623 =20
4fb0a5eb364d23 Jens Wiklander    2015-04-14  624  	optee =3D kzalloc(sizeof=
(*optee), GFP_KERNEL);
4fb0a5eb364d23 Jens Wiklander    2015-04-14  625  	if (!optee) {
4fb0a5eb364d23 Jens Wiklander    2015-04-14  626  		rc =3D -ENOMEM;
4fb0a5eb364d23 Jens Wiklander    2015-04-14  627  		goto err;
4fb0a5eb364d23 Jens Wiklander    2015-04-14  628  	}
4fb0a5eb364d23 Jens Wiklander    2015-04-14  629 =20
4fb0a5eb364d23 Jens Wiklander    2015-04-14  630  	optee->invoke_fn =3D inv=
oke_fn;
d885cc5e0759fc Volodymyr Babchuk 2017-11-29  631  	optee->sec_caps =3D sec_=
caps;
4fb0a5eb364d23 Jens Wiklander    2015-04-14  632 =20
4fb0a5eb364d23 Jens Wiklander    2015-04-14  633  	teedev =3D tee_device_al=
loc(&optee_desc, NULL, pool, optee);
4fb0a5eb364d23 Jens Wiklander    2015-04-14  634  	if (IS_ERR(teedev)) {
4fb0a5eb364d23 Jens Wiklander    2015-04-14  635  		rc =3D PTR_ERR(teedev);
4fb0a5eb364d23 Jens Wiklander    2015-04-14  636  		goto err;
4fb0a5eb364d23 Jens Wiklander    2015-04-14  637  	}
4fb0a5eb364d23 Jens Wiklander    2015-04-14  638  	optee->teedev =3D teedev;
4fb0a5eb364d23 Jens Wiklander    2015-04-14  639 =20
4fb0a5eb364d23 Jens Wiklander    2015-04-14  640  	teedev =3D tee_device_al=
loc(&optee_supp_desc, NULL, pool, optee);
4fb0a5eb364d23 Jens Wiklander    2015-04-14  641  	if (IS_ERR(teedev)) {
4fb0a5eb364d23 Jens Wiklander    2015-04-14  642  		rc =3D PTR_ERR(teedev);
4fb0a5eb364d23 Jens Wiklander    2015-04-14  643  		goto err;
4fb0a5eb364d23 Jens Wiklander    2015-04-14  644  	}
4fb0a5eb364d23 Jens Wiklander    2015-04-14  645  	optee->supp_teedev =3D t=
eedev;
4fb0a5eb364d23 Jens Wiklander    2015-04-14  646 =20
4fb0a5eb364d23 Jens Wiklander    2015-04-14  647  	rc =3D tee_device_regist=
er(optee->teedev);
4fb0a5eb364d23 Jens Wiklander    2015-04-14  648  	if (rc)
4fb0a5eb364d23 Jens Wiklander    2015-04-14  649  		goto err;
4fb0a5eb364d23 Jens Wiklander    2015-04-14  650 =20
4fb0a5eb364d23 Jens Wiklander    2015-04-14  651  	rc =3D tee_device_regist=
er(optee->supp_teedev);
4fb0a5eb364d23 Jens Wiklander    2015-04-14  652  	if (rc)
4fb0a5eb364d23 Jens Wiklander    2015-04-14  653  		goto err;
4fb0a5eb364d23 Jens Wiklander    2015-04-14  654 =20
4fb0a5eb364d23 Jens Wiklander    2015-04-14  655  	mutex_init(&optee->call_=
queue.mutex);
4fb0a5eb364d23 Jens Wiklander    2015-04-14  656  	INIT_LIST_HEAD(&optee->c=
all_queue.waiters);
4fb0a5eb364d23 Jens Wiklander    2015-04-14  657  	optee_wait_queue_init(&o=
ptee->wait_queue);
4fb0a5eb364d23 Jens Wiklander    2015-04-14  658  	optee_supp_init(&optee->=
supp);
4fb0a5eb364d23 Jens Wiklander    2015-04-14  659  	optee->memremaped_shm =
=3D memremaped_shm;
4fb0a5eb364d23 Jens Wiklander    2015-04-14  660  	optee->pool =3D pool;
4fb0a5eb364d23 Jens Wiklander    2015-04-14  661 =20
4fb0a5eb364d23 Jens Wiklander    2015-04-14  662  	optee_enable_shm_cache(o=
ptee);
4fb0a5eb364d23 Jens Wiklander    2015-04-14  663 =20
595311cf7e49c7 Ard Biesheuvel    2019-12-09  664  	platform_set_drvdata(pde=
v, optee);
595311cf7e49c7 Ard Biesheuvel    2019-12-09  665 =20
4fb0a5eb364d23 Jens Wiklander    2015-04-14  666  	pr_info("initialized dri=
ver\n");
595311cf7e49c7 Ard Biesheuvel    2019-12-09  667  	return 0;
4fb0a5eb364d23 Jens Wiklander    2015-04-14  668  err:
4fb0a5eb364d23 Jens Wiklander    2015-04-14  669  	if (optee) {
4fb0a5eb364d23 Jens Wiklander    2015-04-14  670  		/*
4fb0a5eb364d23 Jens Wiklander    2015-04-14  671  		 * tee_device_unregiste=
r() is safe to call even if the
4fb0a5eb364d23 Jens Wiklander    2015-04-14  672  		 * devices hasn't been =
registered with
4fb0a5eb364d23 Jens Wiklander    2015-04-14  673  		 * tee_device_register(=
) yet.
4fb0a5eb364d23 Jens Wiklander    2015-04-14  674  		 */
4fb0a5eb364d23 Jens Wiklander    2015-04-14  675  		tee_device_unregister(o=
ptee->supp_teedev);
4fb0a5eb364d23 Jens Wiklander    2015-04-14  676  		tee_device_unregister(o=
ptee->teedev);
4fb0a5eb364d23 Jens Wiklander    2015-04-14  677  		kfree(optee);
4fb0a5eb364d23 Jens Wiklander    2015-04-14  678  	}
4fb0a5eb364d23 Jens Wiklander    2015-04-14  679  	if (pool)
4fb0a5eb364d23 Jens Wiklander    2015-04-14  680  		tee_shm_pool_free(pool);
4fb0a5eb364d23 Jens Wiklander    2015-04-14  681  	if (memremaped_shm)
4fb0a5eb364d23 Jens Wiklander    2015-04-14  682  		memunmap(memremaped_shm=
);
595311cf7e49c7 Ard Biesheuvel    2019-12-09  683  	return rc;
4fb0a5eb364d23 Jens Wiklander    2015-04-14  684  }
4fb0a5eb364d23 Jens Wiklander    2015-04-14  685 =20

:::::: The code at line 618 was first introduced by commit
:::::: 4fb0a5eb364d239722e745c02aef0dbd4e0f1ad2 tee: add OP-TEE driver

:::::: TO: Jens Wiklander <jens.wiklander@linaro.org>
:::::: CC: Jens Wiklander <jens.wiklander@linaro.org>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
