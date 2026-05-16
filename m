Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277812F7EFE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 May 2026 07:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778917410; cv=none; b=cYoM6Kye2BdY86P+j0pB1Nc6a8abnDJ4XdsPOmX9Si9d9vfpJRXZF7SrA8U5zbkiv52wFpMlFXex1elDWtI4+GkF0rquQcvOlF7SWtrXQ/tcF++hSpf0VDTclCRZms4m/4QE3XJCAGGKOtDT6ByHihG5CYgAaavwbQLI9jTYd3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778917410; c=relaxed/simple;
	bh=tFvoAPGgVDkkWVEwA0fgqmeZKXqVqXLXlX6W5lRRY00=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IodzwGScFe4Z/mM8pWN+SXzb0HKnR9Oxefe4QEj36DBeZcXlYDMTT4VzIpZojgqfSRzso7Qcg8t359gcdONIzAtlfMryoMwgCWBKeJDyPbkBp+/dRkvhrV/AHBMQTIpX4hjhXpdy+B1u+PCmOCJU79NQ5lsl2AULKY1eMZtZS7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c3STqkq/; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c3STqkq/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778917408; x=1810453408;
  h=date:from:to:cc:subject:message-id;
  bh=tFvoAPGgVDkkWVEwA0fgqmeZKXqVqXLXlX6W5lRRY00=;
  b=c3STqkq/GgRIvceXDm1Q0ZKyDvZ5an/AP2Er6h02NxVgGFOsrQFl1g41
   SylY6yYdUgMi6msS4KQIGLxT+wKVaa01xBkvSMMooIL3O/9ym0BY8J6zc
   jXjDg8Zyy4DRjCT5KyJDzImCkJbK/pUXwXDc1rggsVh4s0Z4j8nV3NkrN
   0weQOUsScV4mWwx7gF9YO/+OngH4C6zyqEb3JzTa+EDbeiStODebpOJpI
   kcYEEv0twx4V7Jmg9fSeKz0cyUwbgFwaFLT50jSSAKo5AHNqLp55d31ej
   w650AW4Tbgwp1KiFZUYWZ5SeEEhjIcM2d/yzCyS+/k0xa15sw5NqsFJYl
   A==;
X-CSE-ConnectionGUID: gaVsk2z1QHeuOb9Nv8ctag==
X-CSE-MsgGUID: 4VsyVbqwRWGBFwDWW4CMfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="97291389"
X-IronPort-AV: E=Sophos;i="6.23,237,1770624000"; 
   d="scan'208";a="97291389"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2026 00:43:28 -0700
X-CSE-ConnectionGUID: GbeEoHclRPGa44QA3OQdTA==
X-CSE-MsgGUID: xdI05Uf/QbCSzZaW2hZvnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,237,1770624000"; 
   d="scan'208";a="262684205"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 16 May 2026 00:43:26 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wO9gC-000000009Hx-1Lfq;
	Sat, 16 May 2026 07:43:24 +0000
Date: Sat, 16 May 2026 09:42:29 +0200
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/090-spi-hid 18/19] checkpatch:
 ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
Message-ID: <202605160946.Fn1uBOPZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/090-spi-hid
head:   4a7734273fefe8146bc62984df580ebdb26da586
commit: bb3d46cc422428b575074197c610ffc526fc41ba [18/19] HID: Add Apple DockChannel HID transport driver
reproduce: (https://download.01.org/0day-ci/archive/20260516/202605160946.Fn1uBOPZ-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#1152: FILE: drivers/hid/dockchannel-hid/dockchannel-hid.c:1065:
+	switch (hdr.channel) {
+		case DCHID_CHANNEL_CMD:
[...]
+		case DCHID_CHANNEL_REPORT:
[...]
+		default:

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
