Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3BA1129E93
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Aug 2024 21:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723843284; cv=none; b=K6qcTSjQj7PdiDlVwjQSzp5ghtf3p2OLnr3O4CkdI084j1sAyy19DLPqxBnBuGBl+efD8QiW72OlEB1GGjXWOK8TDeS2bME60xE7BYrnH0Qpa1aNjlvqNroWkS6g+tXFBMcE+Azyphq8NSG5H0CQxNynyipYrd/6pmONakGIx3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723843284; c=relaxed/simple;
	bh=OvdHQaSBwswUa7jJWiJZvCv6lCjzqU5nVA6GDmhGLCo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hgKsC/bT4hpx9sEUicBHZibm7vwsXQA1ng2yZM49lD54GDU2X9TuGe1+9rthR+cceCI7idObwy2xOFBeCObkRh6sFYfYqG08xuLTBhT+CAM0QRdfo9JVWcnGyJv4jvbaopapRmARXN3qvSI4WzpWObxepq8AQVnVEzN5pR1OodU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H9Fp/UKO; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H9Fp/UKO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723843283; x=1755379283;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OvdHQaSBwswUa7jJWiJZvCv6lCjzqU5nVA6GDmhGLCo=;
  b=H9Fp/UKOz3U80pEpwlSQggQwcHKVj6za+u8yUL8EvuxxHuiflSm/baUP
   2bVIzwzPTQLuHuK4z01hPWliK8XTABlAByvL/oTUuHQhYxTmYlsN6PmR6
   /xcFlhQgFGvICh6HgJUupPWmTwy7p/ltCrk47OJuzQdpoz5z9yua8Buhy
   Y4TRuKmbhxULgVmvHwyu7NYlH7d4SSe+OVmE5MD8DYIaD/t2egmiCWFps
   FolLw0Re1LR7msOhJSUKXRDJGVR1wOk45u1qzBt0FBpt8ep9i9ENASOov
   GJsX6iYXNPqfFCBYS/1RVY9SQSaYjoJPChp/ogBRHMOnNAHoTn1i49jTA
   A==;
X-CSE-ConnectionGUID: wr3G7cSOTXeD3bXU76fbJQ==
X-CSE-MsgGUID: 3W6Tqc0ATS+e9r397x+swg==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="32822713"
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; 
   d="scan'208";a="32822713"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2024 14:21:22 -0700
X-CSE-ConnectionGUID: MAEQjEyMRUq0RkDf2N1vdQ==
X-CSE-MsgGUID: V5hw5/drR/ae1quFDpk9cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; 
   d="scan'208";a="64617698"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 16 Aug 2024 14:21:16 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sf4Nl-0006w7-1e;
	Fri, 16 Aug 2024 21:21:13 +0000
Date: Sat, 17 Aug 2024 05:21:12 +0800
From: kernel test robot <lkp@intel.com>
To: shiju.jose@huawei.com, linux-edac@vger.kernel.org,
	linux-cxl@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, bp@alien8.de, tony.luck@intel.com,
	rafael@kernel.org, lenb@kernel.org, mchehab@kernel.org,
	dan.j.williams@intel.com, dave@stgolabs.net,
	jonathan.cameron@huawei.com, dave.jiang@intel.com,
	alison.schofield@intel.com, vishal.l.verma@intel.com,
	ira.weiny@intel.com, david@redhat.com, Vilas.Sridharan@amd.com,
	leo.duran@amd.com, Yazen.Ghannam@amd.com, rientjes@google.com,
	jiaqiyan@google.com, Jon.Grimm@amd.com, dave.hansen@linux.intel.com,
	naoya.horiguchi@nec.com, james.morse@arm.com, jthoughton@google.com,
	somasundaram.a@hpe.com, erdemaktas@google.com
Subject: Re: [PATCH v11 07/14] cxl/memfeature: Add CXL memory device patrol
 scrub control feature
Message-ID: <202408170751.2MCUO5cJ-lkp@intel.com>
References: <20240816164238.1902-8-shiju.jose@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240816164238.1902-8-shiju.jose@huawei.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on ras/edac-for-next]
[also build test WARNING on rafael-pm/linux-next rafael-pm/bleeding-edge cxl/next linus/master v6.11-rc3 next-20240816]
[cannot apply to cxl/pending]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/shiju-jose-huawei-com/EDAC-Add-support-for-EDAC-device-feature-s-control/20240817-004442
base:   https://git.kernel.org/pub/scm/linux/kernel/git/ras/ras.git edac-for-next
patch link:    https://lore.kernel.org/r/20240816164238.1902-8-shiju.jose%40huawei.com
patch subject: [PATCH v11 07/14] cxl/memfeature: Add CXL memory device patrol scrub control feature
reproduce: (https://download.01.org/0day-ci/archive/20240817/202408170751.2MCUO5cJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408170751.2MCUO5cJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/power/wakeup-source.txt references a file that doesn't exist: Documentation/devicetree/bindings/input/qcom,pm8xxx-keypad.txt
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
>> Warning: Documentation/edac/edac-scrub.rst references a file that doesn't exist: Documentation/ABI/testing/sysfs-edac-scrub-control
   Warning: Documentation/hwmon/g762.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/g762.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/reserved-memory/qcom
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/exynos/
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
