Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E862218ADD
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Jan 2026 20:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769717763; cv=none; b=l8RhUNgjBskUqhOSrMuWd2uNT1RLyllYevNQlu+l+Sqkr+MSIl3lgvguY9TWem+Y8AZpk2Uzo4hK58GznfZeYWPbvmiQdxNg/R92TZzlV3n3TiDSTtC7jBy/UxxwIrIq6YpfJIayEH9D9UznnHobjHKEV2AFi5n9gHrY+bP3VlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769717763; c=relaxed/simple;
	bh=4LxsUcQCYzDtTwtKiiwhGiE9Xdxv5eTPmqp3B70l++Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kX+DZxIHqObwjL0FXzXIFLXRNbjOGFtp9n8juDdPXDOnyATSE+Aj21SZI70TATni+UzTclsnEa82zCmRkWI961aL3GcZFep6CFE8oX1re06FGX1wVe757jwO1du9SfAyPOoPid7wY9TWkKtXesz/sciH/bX05prugQfDh8KdJmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e56rLYD1; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e56rLYD1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769717761; x=1801253761;
  h=date:from:to:cc:subject:message-id;
  bh=4LxsUcQCYzDtTwtKiiwhGiE9Xdxv5eTPmqp3B70l++Q=;
  b=e56rLYD148QvS7fKTJ6qp1wv06esFVY6tTrD9bPKxXpZf15w3fOe6YbK
   A2DMHtMP6Pc+tATNgNIhaC0Kc93xeCk4KwYgTwZrpGTlIE/luEOHFJhsf
   2biOv8/Tkki+juveb4LWxG2I6HfsOMl8eBGdV8bxu5dHhievlTMso+xZM
   sVh6r0lPnkQUTIQBhq4vI1rd+IYXLQt8JvIYY3cVkWTc4RDlbQ8dERKBc
   ogSG97RywJCzz5eRMB1eEme/Ev4VXgudHzZubJaQ/6vrkkpVZmPK6dMlo
   hXObb1wAaMMrS1KTQx3AK4J7BASp93u+qsKI/MclK5gCJoKBF3dLoDf0S
   g==;
X-CSE-ConnectionGUID: sMo89LHETqO8OhBvGIKc7g==
X-CSE-MsgGUID: tfSGO4O6TGq5Z85GCsvt4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="71134157"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; 
   d="scan'208";a="71134157"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 12:16:01 -0800
X-CSE-ConnectionGUID: ElK5akgSRl2NS02Uri4mzg==
X-CSE-MsgGUID: Wq1ze8q1QC2AYiVZFNHqZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; 
   d="scan'208";a="208278932"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 29 Jan 2026 12:15:59 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlYQm-000000002Kr-3zap;
	Thu, 29 Jan 2026 20:15:56 +0000
Date: Thu, 29 Jan 2026 21:15:38 +0100
From: kernel test robot <lkp@intel.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [abelloni:rtc-next 10/10] htmldocs: Warning:
 Documentation/devicetree/bindings/mfd/motorola-cpcap.txt references a file
 that doesn't exist: Documentation/devicetree/bindings/rtc/cpcap-rtc.txt
Message-ID: <202601292114.IYRWI20o-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git rtc-next
head:   96a77ec577d4117f13e2527c9a377d6ba637f5c0
commit: 96a77ec577d4117f13e2527c9a377d6ba637f5c0 [10/10] dt-bindings: rtc: cpcap: convert to schema
reproduce: (https://download.01.org/0day-ci/archive/20260129/202601292114.IYRWI20o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601292114.IYRWI20o-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/arch/arm/keystone/overview.rst references a file that doesn't exist: Documentation/devicetree/bindings/arm/keystone/keystone.txt
   Warning: Documentation/devicetree/bindings/mfd/da9055.txt references a file that doesn't exist: Documentation/devicetree/bindings/sound/da9055.txt
>> Warning: Documentation/devicetree/bindings/mfd/motorola-cpcap.txt references a file that doesn't exist: Documentation/devicetree/bindings/rtc/cpcap-rtc.txt
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt references a file that doesn't exist: Documentation/devicetree/bindings/gpio/gpio-dsp-keystone.txt
>> Warning: Documentation/devicetree/bindings/rtc/motorola,cpcap-rtc.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
   Warning: Documentation/doc-guide/parse-headers.rst references a file that doesn't exist: Documentation/userspace-api/media/Makefile
   Warning: Documentation/trace/rv/da_monitor_instrumentation.rst references a file that doesn't exist: Documentation/trace/rv/da_monitor_synthesis.rst
   Warning: Documentation/translations/it_IT/doc-guide/parse-headers.rst references a file that doesn't exist: Documentation/userspace-api/media/Makefile
   Warning: Documentation/translations/ja_JP/SubmittingPatches references a file that doesn't exist: linux-2.6.12-vanilla/Documentation/dontdiff
   Warning: Documentation/translations/ja_JP/process/submit-checklist.rst references a file that doesn't exist: Documentation/translations/ja_JP/SubmitChecklist

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
