Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B728447F5F
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Oct 2024 18:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727980070; cv=none; b=cOqiTfq7NCl8xcIloN7Kb99BxeH1ibI4/2GNcpj/1pNHYrTvyEXaNpygTH/X1iwwEUV8QBZ5/moZ1ECzl30RT/yBXZOezZTvlrUX8A8o9qpEfUcZ9RL+sS4VXvF6lArR2KXbqiOjkWucVhLLoMLkdnHq2+fT5ULA4wUFSD8Gxmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727980070; c=relaxed/simple;
	bh=97E1fy126WsF8hgiTIENxKXsoCf+VAQ/kcy5kqTZGN8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qiIRKQKG4YZKrl1jfXweDCUD8odjGkRoZLpSmSuRXuhsg4IBiNLPh26XxJOFYNKjEBgb5WBa6wk2OZJbcUuAoxDdZZe8KLxAy1g45SvSUlBqCRAqMTkApG2y5vmV+Um/C40AMQp4ppscU/rgdDpT5d1iZzGKneYj9HLXA7yCkcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WTj4dpyd; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WTj4dpyd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727980068; x=1759516068;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=97E1fy126WsF8hgiTIENxKXsoCf+VAQ/kcy5kqTZGN8=;
  b=WTj4dpydQrUoZ3T7InQE5KWxkmeYPYFmrQwpSRNAsLNXheMn6E/F0AaX
   +khaVjXKEpBdQ4o3XwItQOtQ4wWvkKi9cnebM7IQ8h4hzlNZc2Vniv7oC
   d9DoHZxZq/7MW5WZj5GNb/ApHtVfp9JFGPxA4rGLh0Avk8tWX3Rg0laUF
   NLc8lNPS5WO5epvgiso/ScMcocOSLLjoeTKMaJ2CTgs3CyUZgiUtS0cB0
   Kwt+E0MGnFbKcvBK1itoJucuWCXHW0suRzXaO6NMy042WgMl3Y1L8PjcC
   MGe+f6Be7ZFsQfKvkIpX9ml1hb7yHAf0jT2deJziLSIp2+TfJZiTkgcL6
   w==;
X-CSE-ConnectionGUID: TeeUR8vLTC2VN5kv9yVgag==
X-CSE-MsgGUID: VA6a9BUtT5+dKrANbkrtLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="38326109"
X-IronPort-AV: E=Sophos;i="6.11,175,1725346800"; 
   d="scan'208";a="38326109"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 11:27:48 -0700
X-CSE-ConnectionGUID: isBFRIQuSYGHfN04rB+3dg==
X-CSE-MsgGUID: Lw3X2PK8TQemuOLj/W1S9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,175,1725346800"; 
   d="scan'208";a="105196410"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 03 Oct 2024 11:27:46 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swQYB-0000mK-2r;
	Thu, 03 Oct 2024 18:27:43 +0000
Date: Fri, 4 Oct 2024 02:27:28 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 5957/23811]
 drivers/vfio/vfio_iommu_type1.c:2144:70: sparse: sparse: incorrect type in
 argument 2 (different address spaces)
Message-ID: <202410040218.7HQ3naCI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   5c63bd0fa5e86474d30ecd06d67f2393de081434
commit: 2dd8345826607c5d2d6528de872118da554015b6 [5957/23811] vfio: Add support for Shared Virtual Addressing
config: arm64-randconfig-r121-20241003 (https://download.01.org/0day-ci/archive/20241004/202410040218.7HQ3naCI-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20241004/202410040218.7HQ3naCI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410040218.7HQ3naCI-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/vfio/vfio_iommu_type1.c:2144:70: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] <asn:1> *[assigned] arg @@     got void * @@
   drivers/vfio/vfio_iommu_type1.c:2144:70: sparse:     expected void [noderef] <asn:1> *[assigned] arg
   drivers/vfio/vfio_iommu_type1.c:2144:70: sparse:     got void *
   drivers/vfio/vfio_iommu_type1.c:2164:65: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] <asn:1> *[assigned] arg @@     got void * @@
   drivers/vfio/vfio_iommu_type1.c:2164:65: sparse:     expected void [noderef] <asn:1> *[assigned] arg
   drivers/vfio/vfio_iommu_type1.c:2164:65: sparse:     got void *
   drivers/vfio/vfio_iommu_type1.c:1103:26: sparse: sparse: self-comparison always evaluates to false
   drivers/vfio/vfio_iommu_type1.c:1103:48: sparse: sparse: self-comparison always evaluates to false
   drivers/vfio/vfio_iommu_type1.c:1103:70: sparse: sparse: self-comparison always evaluates to false

vim +2144 drivers/vfio/vfio_iommu_type1.c

  2059	
  2060	static long vfio_iommu_type1_ioctl(void *iommu_data,
  2061					   unsigned int cmd, unsigned long arg)
  2062	{
  2063		struct vfio_iommu *iommu = iommu_data;
  2064		unsigned long minsz;
  2065	
  2066		if (cmd == VFIO_CHECK_EXTENSION) {
  2067			switch (arg) {
  2068			case VFIO_TYPE1_IOMMU:
  2069			case VFIO_TYPE1v2_IOMMU:
  2070			case VFIO_TYPE1_NESTING_IOMMU:
  2071				return 1;
  2072			case VFIO_DMA_CC_IOMMU:
  2073				if (!iommu)
  2074					return 0;
  2075				return vfio_domains_have_iommu_cache(iommu);
  2076			default:
  2077				return 0;
  2078			}
  2079		} else if (cmd == VFIO_IOMMU_GET_INFO) {
  2080			struct vfio_iommu_type1_info info;
  2081	
  2082			minsz = offsetofend(struct vfio_iommu_type1_info, iova_pgsizes);
  2083	
  2084			if (copy_from_user(&info, (void __user *)arg, minsz))
  2085				return -EFAULT;
  2086	
  2087			if (info.argsz < minsz)
  2088				return -EINVAL;
  2089	
  2090			info.flags = VFIO_IOMMU_INFO_PGSIZES;
  2091	
  2092			info.iova_pgsizes = vfio_pgsize_bitmap(iommu);
  2093	
  2094			return copy_to_user((void __user *)arg, &info, minsz) ?
  2095				-EFAULT : 0;
  2096	
  2097		} else if (cmd == VFIO_IOMMU_MAP_DMA) {
  2098			struct vfio_iommu_type1_dma_map map;
  2099			uint32_t mask = VFIO_DMA_MAP_FLAG_READ |
  2100					VFIO_DMA_MAP_FLAG_WRITE;
  2101	
  2102			minsz = offsetofend(struct vfio_iommu_type1_dma_map, size);
  2103	
  2104			if (copy_from_user(&map, (void __user *)arg, minsz))
  2105				return -EFAULT;
  2106	
  2107			if (map.argsz < minsz || map.flags & ~mask)
  2108				return -EINVAL;
  2109	
  2110			return vfio_dma_do_map(iommu, &map);
  2111	
  2112		} else if (cmd == VFIO_IOMMU_UNMAP_DMA) {
  2113			struct vfio_iommu_type1_dma_unmap unmap;
  2114			long ret;
  2115	
  2116			minsz = offsetofend(struct vfio_iommu_type1_dma_unmap, size);
  2117	
  2118			if (copy_from_user(&unmap, (void __user *)arg, minsz))
  2119				return -EFAULT;
  2120	
  2121			if (unmap.argsz < minsz || unmap.flags)
  2122				return -EINVAL;
  2123	
  2124			ret = vfio_dma_do_unmap(iommu, &unmap);
  2125			if (ret)
  2126				return ret;
  2127	
  2128			return copy_to_user((void __user *)arg, &unmap, minsz) ?
  2129				-EFAULT : 0;
  2130	
  2131		} else if (cmd == VFIO_IOMMU_BIND) {
  2132			struct vfio_iommu_type1_bind bind;
  2133	
  2134			minsz = offsetofend(struct vfio_iommu_type1_bind, flags);
  2135	
  2136			if (copy_from_user(&bind, (void __user *)arg, minsz))
  2137				return -EFAULT;
  2138	
  2139			if (bind.argsz < minsz)
  2140				return -EINVAL;
  2141	
  2142			switch (bind.flags) {
  2143			case VFIO_IOMMU_BIND_PROCESS:
> 2144				return vfio_iommu_type1_bind_process(iommu, (void *)arg,
  2145								     &bind);
  2146			default:
  2147				return -EINVAL;
  2148			}
  2149	
  2150		} else if (cmd == VFIO_IOMMU_UNBIND) {
  2151			struct vfio_iommu_type1_bind bind;
  2152	
  2153			minsz = offsetofend(struct vfio_iommu_type1_bind, flags);
  2154	
  2155			if (copy_from_user(&bind, (void __user *)arg, minsz))
  2156				return -EFAULT;
  2157	
  2158			if (bind.argsz < minsz)
  2159				return -EINVAL;
  2160	
  2161			switch (bind.flags) {
  2162			case VFIO_IOMMU_BIND_PROCESS:
  2163				return vfio_iommu_type1_unbind_process(iommu,
  2164								       (void *)arg,
  2165								       &bind);
  2166			default:
  2167				return -EINVAL;
  2168			}
  2169		}
  2170	
  2171		return -ENOTTY;
  2172	}
  2173	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
