Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4540A78F39
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Feb 2026 03:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771298685; cv=none; b=Ct8nJf8waiG60zuTv/8xNcGm++IgdAt5tPLkaiS+YFRgXqFs4sI526DStFqsnSBKMtsIbJlsQ6eM5ZxqnEohVhUwCrPscTYg52TSpi+0YfkRnuCa+S+SY8ALTi6efLE5I1EsYSs6mc1G6U8yXZcw7rrs8wsfbU6TI39Dhd9FtO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771298685; c=relaxed/simple;
	bh=LPuKz4SWVNH82TqpP1h2em379lBcSDWR7MS0vzMn74U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=reXLGp5JZGaVAnpar2EeYACTRK7m/GjlIPZqVo8yQD4M/CeLJKPNwWOYlbeNDtjcv91uWfyzamNVrSHOYe4rA/gCXT9T7Y+n03RRmpogFahbYBGpEk3FL/ocCY1WdSUQNke2MMGLWN6pLB2zBeqPszFn/r7ggZOwgjHD/JkmTRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QMfHVQJO; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QMfHVQJO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771298684; x=1802834684;
  h=date:from:to:cc:subject:message-id;
  bh=LPuKz4SWVNH82TqpP1h2em379lBcSDWR7MS0vzMn74U=;
  b=QMfHVQJOh/nC0gtVLyrw+/t58aMV/4mib/BK7rXXnKhvP1wwQtke7uYP
   nZdfSAoH8cQVOWKp96yPIfZ8om99rFWJdCD0T3MFHOZ5o8VZY1Et7aP2W
   NVmrOynl4nM/rw5SLvRc8Bw4SAzwGso13meAha5+tf7Uv3bYaq3uy4l3X
   PYtTyhdstwjS98SIRm+B1/Lr/Gmlsl/HbUUlFJYIh0mmiWO7VLXQZ29yy
   d8awspkKmkps+pqivnRqYYCPaxXF/sYM9bFs5scR+fVO1oIhO2DOgx4Fu
   9KDNoCVToAcUi1iBRZeWkY1U3BYDypB8XoH3b7Uq9JGelpl/JK35tm5wt
   Q==;
X-CSE-ConnectionGUID: b10VGbyISTmVHRcs2pZJhw==
X-CSE-MsgGUID: tqa/Oin+TCyn2uPzU9iVZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="59935369"
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="59935369"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 19:24:43 -0800
X-CSE-ConnectionGUID: uT826gnbQzCR8cNDgith4A==
X-CSE-MsgGUID: W/zp6u/rSqiOEHp+COsssQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="217900334"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 16 Feb 2026 19:24:42 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsBhX-000000002mH-2ZRw;
	Tue, 17 Feb 2026 03:24:39 +0000
Date: Tue, 17 Feb 2026 04:24:37 +0100
From: kernel test robot <lkp@intel.com>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, Lucas Stach <l.stach@pengutronix.de>,
 linux-doc@vger.kernel.org
Subject: [pengutronix:mfe/v6.19/topic/touchscreen-axiom 5/5]
 htmldocs: Documentation/ABI/testing/sysfs-driver-input-touchnetix-axiom:63:
 WARNING: Block quote ends without a blank line; unexpected unindent.
 [docutils]
Message-ID: <202602170408.zNbIg5NA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.pengutronix.de/git/linux-0-day mfe/v6.19/topic/touchscreen-axiom
head:   a2c0b8aee58d5ef254750920bb8a89e4caaadbab
commit: a2c0b8aee58d5ef254750920bb8a89e4caaadbab [5/5] Input: Add TouchNetix aXiom I2C Touchscreen support
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260217/202602170408.zNbIg5NA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602170408.zNbIg5NA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: Documentation/devicetree/dt-object-internal.txt
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: m,^Documentation/scheduler/sched-pelt
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: m,(Documentation/translations/[
   Using alabaster theme
   Documentation/ABI/testing/sysfs-driver-input-touchnetix-axiom:63: ERROR: Unexpected indentation. [docutils]
>> Documentation/ABI/testing/sysfs-driver-input-touchnetix-axiom:63: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/ABI/testing/sysfs-driver-input-touchnetix-axiom:63: ERROR: Unexpected indentation. [docutils]
>> Documentation/ABI/testing/sysfs-driver-input-touchnetix-axiom:63: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   WARNING: ./include/crypto/skcipher.h:166 struct member 'SKCIPHER_ALG_COMMON' not described in 'skcipher_alg'
   WARNING: ./include/linux/virtio.h:183 struct member 'map' not described in 'virtio_device'
   WARNING: ./include/linux/virtio.h:183 struct member 'VIRTIO_DECLARE_FEATURES(features' not described in 'virtio_device'
   WARNING: ./include/linux/virtio.h:183 struct member 'vmap' not described in 'virtio_device'
   WARNING: ./drivers/gpu/drm/amd/display/dc/dc.h:2796 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst


vim +63 Documentation/ABI/testing/sysfs-driver-input-touchnetix-axiom

  > 63	What:		/sys/bus/i2c/devices/xxx/device_state

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
