Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485831369BC
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Sep 2024 18:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727289697; cv=none; b=ABFQvqyWyG8358uyT0+eDNWrfHk0QPuQ1wqXstti7QBgfNIzP/amWoIA5uORifg53UsaCs6r/32Aw/PYSJ8qeuV5x4/KanQIIWaO39qP4JDR5KQjRgtTwtrohmAYqpUVLX0OKCK8gzfeQm159g7DUP77+Yww+HVMXZDT4rae/wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727289697; c=relaxed/simple;
	bh=NGt2PLlhN8EypJdX9KItqx87j/Ypwn+XfxBXLPKgmf0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=amvF0ZaIKEQ/hXHW6IbG7Tgx71xCWwL7+ZCV9W0ZBlEzR/S6oP733lXmgbuV+8NSypWEc2hx5dbxTggQ5QIe0GTNenSsiTdIc2jKtSncFPgtOdXDt0OUpK5T7XGQS4d2cdqOLQ9EipeJTvC+1dV2hJLQopTejiPKqqsS5nLdW14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kXQLAAVb; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kXQLAAVb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727289696; x=1758825696;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NGt2PLlhN8EypJdX9KItqx87j/Ypwn+XfxBXLPKgmf0=;
  b=kXQLAAVbNoeNLQv4aIUhNDMAFbwVektY55n059NtNVwH839/rlrG9qcc
   aGWaRuZs91EhWFHlnDzdMZiVlwSKrn+0Y3GfCLsHZHgR4HEI7B8tLqK6h
   GQe8S7TEgnipa90CSqj/ipz50rE0gBeub4/rwyFimgOFfOaxK8sQ9s6lp
   wOKdjY9x6Z2BRksZRGL/vEtnGDG1ORNcoc52id1BAWwQU/B7oddX/S8L+
   5+n7ifxFmKZhsii52BcMRLotSAaa+yELi0vRtzt23lUUdskzgJFcGorMD
   orJqTsqJ+VhTfx3X57D9V5pQgYTsZ1AXeeO7bbqLFqWTa78XTobIR751a
   Q==;
X-CSE-ConnectionGUID: H8fh7MWMR7iJ8xXXRZvTpA==
X-CSE-MsgGUID: /erQtciJRMKTtAcxnASXew==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="25834001"
X-IronPort-AV: E=Sophos;i="6.10,258,1719903600"; 
   d="scan'208";a="25834001"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 11:41:35 -0700
X-CSE-ConnectionGUID: bA5MDDuiSaWKED6Vwc7j5w==
X-CSE-MsgGUID: DOwELfn4TxWd3MsiKJoNJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,258,1719903600"; 
   d="scan'208";a="76665369"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 25 Sep 2024 11:41:34 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1stWxA-000Jsv-02;
	Wed, 25 Sep 2024 18:41:32 +0000
Date: Thu, 26 Sep 2024 02:41:23 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [morse:mpam/snapshot+extras/v6.11-rc1 47/154] htmldocs: Warning:
 MAINTAINERS references a file that doesn't exist:
 Documentation/arch/x86/resctrl*
Message-ID: <202409260221.GQHSVNQl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi James,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot+extras/v6.11-rc1
head:   c3aced7ca696f2388520f4a09feab82a8f9b079f
commit: 1c58b89b79f03fd9013a8a2da78f87424fbcb97f [47/154] x86,fs/resctrl: Move resctrl.rst to live under Documentation/filesystems
reproduce: (https://download.01.org/0day-ci/archive/20240926/202409260221.GQHSVNQl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409260221.GQHSVNQl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/hwmon/g762.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/g762.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/reserved-memory/qcom
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/exynos/
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/arch/x86/resctrl*
>> Warning: arch/x86/kernel/cpu/resctrl/monitor.c references a file that doesn't exist: Documentation/arch/x86/resctrl.rst
>> Warning: fs/resctrl/Kconfig references a file that doesn't exist: file:Documentation/arch/x86/resctrl.rst
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
