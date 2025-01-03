Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A201B87FA
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Jan 2025 11:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735905534; cv=none; b=VfGE3FoHEVJopY3XUPeJNFXPTP8vVn40t8mJmu/WAYvZxGO20n8jfHGpbrgIDViSwYlz+pmgPpyKuQ/IVOBiHUxsJ0FrwzEQZD9HgvGIDRH9WOT0a8vWgDBxn23xpd4m/erM0baKPhOIPSkNVyAfvLImR3c5j9NiOY2VbC9Xb/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735905534; c=relaxed/simple;
	bh=f6UY6MUHnVaJUkjb2kx/uTugt47g+EprsTnV3N1NrFg=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=R8bmq3cpjjXZnCRcLPO45IQhR7QBm4b2WucFtETWkGmiOE2UUAtMfX9bQEn52Jli2IpyJqbMx2vl9dzFq+s1x9y69FWU8mODcISA/YUfbVA6EIzRkobQT6ob+clEzy+mhc7VC/C6xRdNdHMxtJwCbUW/h7aFLNSFTsrYZm4UnlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=CEqYslvg; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="CEqYslvg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5PHqPIILjfDOxgWqvFktoKDD+bLbn9GgwJGsoVSmUus=;
  b=CEqYslvg9HfM0lxSrm03WY02nhdvKyTR4JT2+qwE8kcBC513im2ZjBWB
   pmYUxgqzPhfUgLVlgfwTwB33PtpcC9X/rAcJN+A+t8K/TxLoBsUGQj9e9
   1Rxm55g+VrhqJmEBJGIoBmsb3u4Dt5VBOLvfSpf/F4Mh1Hz0WqiGk10ql
   w=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.12,286,1728943200"; 
   d="scan'208";a="201326658"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2025 12:58:43 +0100
Date: Fri, 3 Jan 2025 12:58:43 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
To: Zheng Zengkai <zhengzengkai@huawei.com>
cc: kernel@openeuler.org, oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2616/2616] arch/arm64/kernel/mpam/mpam_device.c:1838:1-33:
 WARNING: Function "for_each_available_child_of_node" should have of_node_put()
 before break around line 1841. (fwd)
Message-ID: <5eb53592-9fd8-60f0-db74-a9da53318f85@inria.fr>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hello,

I think I reported on this previously, or perhaps  at another code
location.  Maybe the of_node_put is hidden in the call to
mpam_discovery_failed, but it could be better to make it explicit in the
loop so it is directly clear that the needed cleanup is done.

julia

---------- Forwarded message ----------
Date: Fri, 3 Jan 2025 19:41:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [openeuler:OLK-5.10 2616/2616]
    arch/arm64/kernel/mpam/mpam_device.c:1838:1-33: WARNING: Function
    "for_each_available_child_of_node" should have of_node_put() before break
    around line 1841.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: kernel@openeuler.org
TO: Zheng Zengkai <zhengzengkai@huawei.com>

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   d51fb86ce6a3a3e59d7cba58738b63903b8cb37c
commit: c0ec28ac9769e4df7757ba3ed94295446243ec31 [2616/2616] arm64/mpam: refactor device tree structure to support multiple devices
:::::: branch date: 4 hours ago
:::::: commit date: 2 years, 11 months ago
config: arm64-randconfig-r052-20250101 (https://download.01.org/0day-ci/archive/20250103/202501031939.oFEiUJOt-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202501031939.oFEiUJOt-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/arm64/kernel/mpam/mpam_device.c:1838:1-33: WARNING: Function "for_each_available_child_of_node" should have of_node_put() before break around line 1841.

vim +/for_each_available_child_of_node +1838 arch/arm64/kernel/mpam/mpam_device.c

7926bf06ce9fb8 Xingang Wang 2022-01-10  1817
7926bf06ce9fb8 Xingang Wang 2022-01-10  1818  static int arm_mpam_device_probe(struct platform_device *pdev)
7926bf06ce9fb8 Xingang Wang 2022-01-10  1819  {
7926bf06ce9fb8 Xingang Wang 2022-01-10  1820  	int ret;
c0ec28ac9769e4 Xingang Wang 2022-01-29  1821  	struct device *dev = &pdev->dev;
c0ec28ac9769e4 Xingang Wang 2022-01-29  1822  	struct device_node *node = dev->of_node;
c0ec28ac9769e4 Xingang Wang 2022-01-29  1823  	struct device_node *child = NULL;
7926bf06ce9fb8 Xingang Wang 2022-01-10  1824
7926bf06ce9fb8 Xingang Wang 2022-01-10  1825  	if (!cpus_have_const_cap(ARM64_HAS_MPAM))
7926bf06ce9fb8 Xingang Wang 2022-01-10  1826  		return 0;
7926bf06ce9fb8 Xingang Wang 2022-01-10  1827
7926bf06ce9fb8 Xingang Wang 2022-01-10  1828  	if (!acpi_disabled || mpam_enabled != MPAM_ENABLE_OF)
7926bf06ce9fb8 Xingang Wang 2022-01-10  1829  		return 0;
7926bf06ce9fb8 Xingang Wang 2022-01-10  1830
c0ec28ac9769e4 Xingang Wang 2022-01-29  1831  	if (!node || !of_match_node(arm_mpam_of_device_ids, pdev->dev.of_node))
c0ec28ac9769e4 Xingang Wang 2022-01-29  1832  		return -EINVAL;
c0ec28ac9769e4 Xingang Wang 2022-01-29  1833
7926bf06ce9fb8 Xingang Wang 2022-01-10  1834  	ret = mpam_discovery_start();
7926bf06ce9fb8 Xingang Wang 2022-01-10  1835  	if (ret)
7926bf06ce9fb8 Xingang Wang 2022-01-10  1836  		return ret;
7926bf06ce9fb8 Xingang Wang 2022-01-10  1837
c0ec28ac9769e4 Xingang Wang 2022-01-29 @1838  	for_each_available_child_of_node(node, child) {
c0ec28ac9769e4 Xingang Wang 2022-01-29  1839  		ret = of_mpam_add_child(pdev, child);
c0ec28ac9769e4 Xingang Wang 2022-01-29  1840  		if (ret)
c0ec28ac9769e4 Xingang Wang 2022-01-29 @1841  			break;
c0ec28ac9769e4 Xingang Wang 2022-01-29  1842  	}
7926bf06ce9fb8 Xingang Wang 2022-01-10  1843
7926bf06ce9fb8 Xingang Wang 2022-01-10  1844  	if (ret) {
7926bf06ce9fb8 Xingang Wang 2022-01-10  1845  		mpam_discovery_failed();
7926bf06ce9fb8 Xingang Wang 2022-01-10  1846  	} else {
7926bf06ce9fb8 Xingang Wang 2022-01-10  1847  		ret = mpam_discovery_complete();
7926bf06ce9fb8 Xingang Wang 2022-01-10  1848  		if (!ret)
7926bf06ce9fb8 Xingang Wang 2022-01-10  1849  			pr_info("Successfully init mpam by DT.\n");
7926bf06ce9fb8 Xingang Wang 2022-01-10  1850  	}
7926bf06ce9fb8 Xingang Wang 2022-01-10  1851
7926bf06ce9fb8 Xingang Wang 2022-01-10  1852  	return ret;
7926bf06ce9fb8 Xingang Wang 2022-01-10  1853  }
7926bf06ce9fb8 Xingang Wang 2022-01-10  1854

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
