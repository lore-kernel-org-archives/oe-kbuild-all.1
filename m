Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F50AD27E
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Oct 2024 02:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728095154; cv=none; b=FO/wtYRxBQ3h9hNY5jVcXUmhca7kPGoHduMj9QLxYTh9SDm1PejDZ32FY6W8rVCTUfoTDX9b8qzYRHMlvonMzs/TBiyylH95ZXpawoziDtBajzUoSY2dr4AYSDc3+/dvf/7zXYrM/8gazlSZB42Y8J5AaJwhboFjMB00KmH9Hf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728095154; c=relaxed/simple;
	bh=wxHYUtP+iT9PGfwLUakB0zN2VtFNg98cS+Uh17DXKl0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i4kNWrT04w9xV2l7kAQ4f8ue/yGZcVktWF7NIWy+SSyD1MHV7vJ3xo/dcG+FJoHBcA/MBkK3lpEesO4swAySNIWjdwdzW9yhBYXpHhuFW7BIlXdkruRqMq7OIuFPcMNB6LCT917wSY9x1/MPhLuJlyHaB8byh7tmXHCnLieDuIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TmXVEtHa; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TmXVEtHa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728095152; x=1759631152;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wxHYUtP+iT9PGfwLUakB0zN2VtFNg98cS+Uh17DXKl0=;
  b=TmXVEtHaq1G5FnCjIM/Bslw8nvy8dZnWMKHIZ/KXkEmcj56cJrWRSxxA
   zdW24uvJIHNibhRyvqZ6xm0kr6/sGrp6T+JFOIZZ1gnLql+QN/1bPW5WJ
   EgUuivUTKvRUelU+kRTdRtSnMuM/11X+fahND9na9oOi2or/VEnmgY7iG
   NaTxzYVSVimKJVAUvDGTV+6E74thLAa7hlIzL+dTMRobfIO7TUGz67E/m
   d+uV2bWfC8VohnyU9JxYAwbAKLN6lh1xfa+Ir3Sy+JkYEET4Tc5E1i/R1
   PKhVy7XAcoIsN6HI58ESMjhjVDawZUe0Phh2ZeUZpVuzZp4AZ4+m7n/mW
   Q==;
X-CSE-ConnectionGUID: FquthP96QwiyxmRJPStKRA==
X-CSE-MsgGUID: C/VrqU0/Rx+w9Nd7UBf2FQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="38692470"
X-IronPort-AV: E=Sophos;i="6.11,179,1725346800"; 
   d="scan'208";a="38692470"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 19:25:51 -0700
X-CSE-ConnectionGUID: W+qwAmheTZiy1WyBOxyYJg==
X-CSE-MsgGUID: MA57U3bhT+CuzKmLG7Pmdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,179,1725346800"; 
   d="scan'208";a="74711366"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 04 Oct 2024 19:25:50 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swuUO-0002SU-0A;
	Sat, 05 Oct 2024 02:25:48 +0000
Date: Sat, 5 Oct 2024 10:25:13 +0800
From: kernel test robot <lkp@intel.com>
To: Asher Song <Asher.Song@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Shiwu Zhang <shiwu.zhang@amd.com>,
	linux-doc@vger.kernel.org
Subject: [agd5f:amd-6.2 990/3034] htmldocs: Warning:
 include/kcl/backport/kcl_hmm.h references a file that doesn't exist:
 Documentation/vm/hmm.rst
Message-ID: <202410051040.VYW6OAst-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/agd5f/linux.git amd-6.2
head:   89450c67d99b47b5c1929a5cd2d8467b6ee686a4
commit: 379fd826b38e44fac7800e82adea9e04a9f6b7bf [990/3034] drm/amdkcl: clear up the license left out during rebase
reproduce: (https://download.01.org/0day-ci/archive/20241005/202410051040.VYW6OAst-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410051040.VYW6OAst-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/power/wakeup-source.txt references a file that doesn't exist: Documentation/devicetree/bindings/input/qcom,pm8xxx-keypad.txt
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/gpu/amdgpu/display/display-contributing.rst references a file that doesn't exist: Documentation/GPU/amdgpu/display/mpo-overview.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/regulator/microchip,mcp16502.yaml
>> Warning: include/kcl/backport/kcl_hmm.h references a file that doesn't exist: Documentation/vm/hmm.rst
   Warning: /sys/class/leds/<led>/rx is defined 2 times:  ./Documentation/ABI/testing/sysfs-class-led-trigger-tty:7  ./Documentation/ABI/testing/sysfs-class-led-trigger-netdev:49
   Warning: /sys/class/leds/<led>/tx is defined 2 times:  ./Documentation/ABI/testing/sysfs-class-led-trigger-tty:15  ./Documentation/ABI/testing/sysfs-class-led-trigger-netdev:34
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
