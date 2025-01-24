Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2C61D63FB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Jan 2025 04:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737691904; cv=none; b=cdBeu0yJIS1qx9lh5yjn7lDbiu3bhQ/hAOXxNwBiSc3+aXo7LesXK3G5HB9Ze62gcDF9oAuXbX9iaEvqaOpNTmwLIPMciX6FAzmdG2yRrPiWEUPmI6zGEn7/pgt4+C2QSKh3o+HEv8kukvlc9ab1tUbTHLSPaUcLlOHxv23tgqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737691904; c=relaxed/simple;
	bh=htWCQ6fuLgVDUrwtJLdGAsgycgn8QwjfxxB87oGKnnc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Tr/aZ3/aPbVwJ5QzD5E0OnOwuqnIHe2JaoLUXCFGl4KtleIjK3wXaAtp3+SU3eOSwQHia5XYJbOFF5XcT1SwleHekGR3QnQ//7pCeAxfYrBEqntPdXYej6cX2RFHWIAr6KRK5t0WZZu7+V+7CtrSb7VSRJL4GiJ+S4YvjJ//JM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ckj/XuYh; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ckj/XuYh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737691902; x=1769227902;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=htWCQ6fuLgVDUrwtJLdGAsgycgn8QwjfxxB87oGKnnc=;
  b=ckj/XuYhiwTl0W3/q3UBzdL0nIhK0w5N0czx74SO6v+gaybYbi1CNdLl
   vL+runelAoF9RQSyJkovALrv+wD7Pyu0HYCH1V0V3kHt2peZ+WeSiGbUJ
   2qVK9X2gKIZl/GyAGw8kiVMQr4M3JgDdi0dbQx8TwStW2djOCrV687Sd1
   UiglS0A9PS2vCQCLvjLJvL6/mFFmej/gQNMtKhUQ5al0XtLYjj3nbPlUz
   cAfFFwWk62rH0MTLD/ucMTekA8u+N/bHctsiillWt0w6y1unBLIb2atIc
   pJcluFf8GAXVGxKXeAuIEKayzIgRZ2eYmJKsw5Ssz6VPoy+tKG6RwdXTE
   g==;
X-CSE-ConnectionGUID: +ZqT7g+9TpqNtvZZSaYzmQ==
X-CSE-MsgGUID: DjExtVFVSd2pxBZ6pUSUNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="48725431"
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; 
   d="scan'208";a="48725431"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 20:11:42 -0800
X-CSE-ConnectionGUID: 0DAFLexAQPO96KchbY+tuw==
X-CSE-MsgGUID: He91Ja7LQ0CdNrwRkfsRSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; 
   d="scan'208";a="107789793"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 23 Jan 2025 20:11:40 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbB2g-000c8E-1s;
	Fri, 24 Jan 2025 04:11:38 +0000
Date: Fri, 24 Jan 2025 12:11:11 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1414/1414] kismet: WARNING: unmet
 direct dependencies detected for UACCE when selected by CRYPTO_DEV_HISI_QM
Message-ID: <202501241258.8qIBGGVy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   da51139d17e9d53d61a9877d9042e43b85d71ee1
commit: c89f49b5f6b23b319f338f7e9e7e9b077ec8f5ff [1414/1414] crypto: hisilicon delete invlaid api and config
config: arm64-kismet-CONFIG_UACCE-CONFIG_CRYPTO_DEV_HISI_QM-0-0 (https://download.01.org/0day-ci/archive/20250124/202501241258.8qIBGGVy-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250124/202501241258.8qIBGGVy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501241258.8qIBGGVy-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for UACCE when selected by CRYPTO_DEV_HISI_QM
   WARNING: unmet direct dependencies detected for UACCE
     Depends on [n]: IOMMU_API [=n]
     Selected by [y]:
     - CRYPTO_DEV_HISI_QM [=y] && CRYPTO [=y] && CRYPTO_HW [=y] && ARM64 [=y] && PCI [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
