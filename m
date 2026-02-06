Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A4A2E62C3
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Feb 2026 04:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770353506; cv=none; b=d10FtnZJ68BAcexmS+zsBmiCzDiTVrdEKQqjtf1Hj4PtLthua/cdfFg6hYXvhoXURd2M0YTGeNPIFxiGdkg5o20bePFZ6Z4Cc4cbjP36C1X555kYRLpJCxI2yjHuBTqKD4r3Py0ePxNWfFMS7XzmK5zGQWRfISMIWRcC+zCx/7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770353506; c=relaxed/simple;
	bh=2nhfF70eCzQp2ZPORrL7vl36xGVXCCp7z1Z62/Qys38=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iIGb0dUy2yRLnstS3UHXYzLQfTnregQAJJOF112ZhndQx7dmo5jPNaHzaogU2e6ytF8WVob4TLYfenznoUH6RzxfkcLGLDYO4Ji/3ykxP/EdsHuBrEOOuU02h6Syz8n0O4B7hxzI5kT27d95EtdbuuPT7w/3K3fcSL0GmrXi/ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jKhqszPO; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jKhqszPO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770353506; x=1801889506;
  h=date:from:to:cc:subject:message-id;
  bh=2nhfF70eCzQp2ZPORrL7vl36xGVXCCp7z1Z62/Qys38=;
  b=jKhqszPOhpE727Zg+0JT1PVFh9eQVmjYHgTqsfJB5NZl4lI0TB+Ezza9
   89omllzLTbyHwiGU0Bdt6Ho36toMoCaWbWzRBC++b79uDU3g0QCcgVJDq
   jIjqo/obeZS2K5L9i9q3EWI4s+goAEw4WIKuX1EqiYnH1JNxZqySgH+I9
   jk318h0hwKpmXbD+LL/F/FcuS1gue9QyHZl+MAK/S3cXVNGy1BbQaUK+c
   l+W3IqmQYEV1BTewognaAlz/u1nFbTyek4TSL7gpzXY0/7nBQHAvElgxJ
   CFjvvmGPqB60jpfW3fZF/c66pf5LolCI6nmjv9TElilYV74IGR/xBVMz5
   g==;
X-CSE-ConnectionGUID: gtyN0nElS2yUZk7TGpLM3A==
X-CSE-MsgGUID: n+SCmbFWQRu4VvXBAstyiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="82999952"
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; 
   d="scan'208";a="82999952"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 20:51:45 -0800
X-CSE-ConnectionGUID: c2mFAhBOS2iMEuvTaIb+iw==
X-CSE-MsgGUID: 8SANJJG8Rb6gQi6St/n+Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; 
   d="scan'208";a="210690222"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 05 Feb 2026 20:51:43 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voDoj-00000000kQw-0g7X;
	Fri, 06 Feb 2026 04:51:41 +0000
Date: Fri, 06 Feb 2026 12:50:43 +0800
From: kernel test robot <lkp@intel.com>
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
 Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
Subject: [linux-next:master 5859/12094]
 drivers/net/wireless/ath/ath12k/qmi.c:3342 ath12k_qmi_aux_uc_load() warn:
 inconsistent indenting
Message-ID: <202602061221.5SCuwKhy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9845cf73f7db6094c0d8419d6adb848028f4a921
commit: b065ccf4193ed5f0c224b53fc2cb829a0e2b701e [5859/12094] wifi: ath12k: support downloading auxiliary ucode image for QCC2072
config: arm64-randconfig-r073-20260206 (https://download.01.org/0day-ci/archive/20260206/202602061221.5SCuwKhy-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602061221.5SCuwKhy-lkp@intel.com/

smatch warnings:
drivers/net/wireless/ath/ath12k/qmi.c:3342 ath12k_qmi_aux_uc_load() warn: inconsistent indenting

vim +3342 drivers/net/wireless/ath/ath12k/qmi.c

  3294	
  3295	static int ath12k_qmi_aux_uc_load(struct ath12k_base *ab)
  3296	{
  3297		struct m3_mem_region *aux_uc_mem = &ab->qmi.aux_uc_mem;
  3298		const struct firmware *fw = NULL;
  3299		const void *aux_uc_data;
  3300		char path[100];
  3301		size_t aux_uc_len;
  3302		int ret;
  3303	
  3304		if (ab->fw.aux_uc_data && ab->fw.aux_uc_len > 0) {
  3305			/* firmware-N.bin had a aux_uc firmware file so use that */
  3306			aux_uc_data = ab->fw.aux_uc_data;
  3307			aux_uc_len = ab->fw.aux_uc_len;
  3308		} else {
  3309			/*
  3310			 * No aux_uc file in firmware-N.bin so try to request old
  3311			 * separate aux_ucode.bin.
  3312			 */
  3313			fw = ath12k_core_firmware_request(ab, ATH12K_AUX_UC_FILE);
  3314			if (IS_ERR(fw)) {
  3315				ret = PTR_ERR(fw);
  3316				ath12k_core_create_firmware_path(ab, ATH12K_AUX_UC_FILE,
  3317								 path, sizeof(path));
  3318				ath12k_err(ab, "failed to load %s: %d\n", path, ret);
  3319				return ret;
  3320			}
  3321	
  3322			aux_uc_data = fw->data;
  3323			aux_uc_len = fw->size;
  3324		}
  3325	
  3326		/* In recovery/resume cases, AUX_UC buffer is not freed, try to reuse that */
  3327		if (aux_uc_mem->vaddr) {
  3328			if (aux_uc_mem->total_size >= aux_uc_len)
  3329				goto copy;
  3330	
  3331			/* Old buffer is too small, free and reallocate */
  3332			ath12k_qmi_aux_uc_free(ab);
  3333		}
  3334	
  3335		aux_uc_mem->vaddr = dma_alloc_coherent(ab->dev, aux_uc_len,
  3336						       &aux_uc_mem->paddr, GFP_KERNEL);
  3337		if (!aux_uc_mem->vaddr) {
  3338			ret = -ENOMEM;
  3339			goto out;
  3340		}
  3341	
> 3342		 aux_uc_mem->total_size = aux_uc_len;
  3343	
  3344	copy:
  3345		memcpy(aux_uc_mem->vaddr, aux_uc_data, aux_uc_len);
  3346		aux_uc_mem->size = aux_uc_len;
  3347	
  3348		ret = 0;
  3349	
  3350	out:
  3351		release_firmware(fw);
  3352	
  3353		return ret;
  3354	}
  3355	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
