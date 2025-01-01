Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E6E1854
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Jan 2025 09:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735724853; cv=none; b=DNUqZWaD+O13kHafrhOB50ZhKgKXgrrY8zhw0INbpIVuLzAskPb2nXx+QmyB/GIB4aELI/wMFWe+DrdN62JyVtNBl/qyXJm49fl7JcOmBjATrRxltVvOp+23htD3AqCz8K4qK9wpk43mOMjjtsLL04TNbx27e8oAx1YNqhwmGSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735724853; c=relaxed/simple;
	bh=kAXKLwBTPaG1WVubQzpu2OOL2furrYcjWMbNaoTo2hA=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=oE1RopY23DqU4J5l4+ITSgZM4fjYnFV9veodkvUeKikxhKsS5YIp3lamcn0JHZT1VhOqjuQIxizyHvYh6vVYuBtoQ0U3NUp8pR+f5gVCLAaX8PkvYOqTDtUu4WhdDo8WdQxXWx72JJfdU+qfM30b3cH2IG06jUytCfQRGug37ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=efSUUKan; arc=none smtp.client-ip=192.134.164.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="efSUUKan"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bHZ1yTZ7XlXBNAt7R1jo4BLntBjIcHUZWOxaVpcop1A=;
  b=efSUUKanXkjhgsIz49dwrIdywoDlSK1kmC3R/aivmVn7YT1aVrkyPu0T
   jT80qsW4Y2eBNLsxsMJ+N6l+05QKzdGvhxsKgSJwOQxcXptdnM9OQROUj
   R3ZXoaZU60Y7nZ4IeqDXPzpIRaFejFzvC/5ZHxWtb9i0UG0CEC4gtBuOI
   M=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.12,281,1728943200"; 
   d="scan'208";a="105347126"
Received: from 231.85.89.92.rev.sfr.net (HELO hadrien) ([92.89.85.231])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jan 2025 10:47:21 +0100
Date: Wed, 1 Jan 2025 10:47:21 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Zheng Zengkai <zhengzengkai@huawei.com>
cc: kernel@openeuler.org, oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2616/2616] arch/arm64/kernel/mpam/mpam_device.c:1838:1-33:
 WARNING: Function "for_each_available_child_of_node" should have of_node_put()
 before break around line 1841. (fwd)
Message-ID: <alpine.DEB.2.22.394.2501011045480.3307@hadrien>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hello,

I odm't know what mpam_discovery_failed does; maybe it takes care of the
needed of_node_put.  But normally these are placed explicitly in the loop
rather than hidden in some other function, so it could be good to consider
doing that here.

julia

---------- Forwarded message ----------
Date: Wed, 1 Jan 2025 14:56:31 +0800
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
head:   55bf638d3d29c53ddd64ed89efda8b70b47ccbbc
commit: c0ec28ac9769e4df7757ba3ed94295446243ec31 [2616/2616] arm64/mpam: refactor device tree structure to support multiple devices
:::::: branch date: 22 hours ago
:::::: commit date: 2 years, 11 months ago
config: arm64-randconfig-r052-20250101 (https://download.01.org/0day-ci/archive/20250101/202501011414.RzBqzjeq-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202501011414.RzBqzjeq-lkp@intel.com/

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
