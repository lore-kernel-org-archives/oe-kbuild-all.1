Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32AC204C0C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 19 Jul 2025 04:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752900816; cv=none; b=r4MahEIV+ieBMlh8QUbyzNx7ZJJzyMIovvMfTiDUHZG21sDq6CsMsKnEJwDKr1InUZa+53py9Sv3WilQB6yy/oQcpVa2575prm9pfHldNLm6yCfN3M77BEBmWMxzOz+AAguo/zMco4IHkVk6jcMwJ6Rb1CDL47DC7N8bqJP8nEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752900816; c=relaxed/simple;
	bh=KRpI6+KNROO/Fwjby4CU7lwzXK0T2ewW4CBhrMKjMAA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gTwNyWU1QNXTYRNy/nnsziYvv2jOVLQ21+KHWXdOW58HqFSDQdRpkOUV6qRqQveluE9EACeYflTaPQgOMQ52AqiQIsgOJ4KE+9Khjf8liVd4Pp/vR1NkOFwaV9TCT612NHTbhgo2Ch4U6sfqmHLTMO4nfUwcVptzskLAE7i6xv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NrR0BG9H; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NrR0BG9H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752900815; x=1784436815;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KRpI6+KNROO/Fwjby4CU7lwzXK0T2ewW4CBhrMKjMAA=;
  b=NrR0BG9HWQuYH0CPgdUsSWVwIh0gu5joKtW5JIsS1c4RmgacbR3aFHkX
   B/nhZ23M7DaKrL/NT0mwpyp2+O+Z6EBJRLybNZI+jhQeNIHHMHOTHJB9Z
   WICv4K6qPz+uPMtvcsQxH9nA4NQThjXLU++kdY0wlWXASQvTEOZx1DIZc
   7PPKWL5rdmPbzngZDsBJyMcWt2SzlD1FzwLhqEC9hQD/hy0gfMdUVXYgZ
   3gLxPynSXpN3hE7705P62usFWR5y7dCrjUcbMyuCrjhgmbJtgS4D9Ogxu
   ZkocT5KuVRbtzX8YyFDB+HKuFAlzX3aIYY4QqqKarORMchudT1srqDOh7
   g==;
X-CSE-ConnectionGUID: LVYyLscgQCicJGrvv/sGmA==
X-CSE-MsgGUID: S0tgZPYGQ4aIua0Wte+BWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11496"; a="65454383"
X-IronPort-AV: E=Sophos;i="6.16,323,1744095600"; 
   d="scan'208";a="65454383"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2025 21:53:35 -0700
X-CSE-ConnectionGUID: 7m2/MUFUR6KiJZCOR3t4/g==
X-CSE-MsgGUID: phgBqLOvTbO86WJvc/CVvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,323,1744095600"; 
   d="scan'208";a="159088466"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 18 Jul 2025 21:53:33 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uczZi-000FFf-1s;
	Sat, 19 Jul 2025 04:53:30 +0000
Date: Sat, 19 Jul 2025 12:53:05 +0800
From: kernel test robot <lkp@intel.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: oe-kbuild-all@lists.linux.dev, Bjorn Andersson <andersson@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [linux-next:master 10906/11307]
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dtb: /sound: failed to match
 any schema with compatible: ['fairphone,fp4-sndcard']
Message-ID: <202507191215.XtOfM64r-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d086c886ceb9f59dea6c3a9dae7eb89e780a20c9
commit: 022926c8d2a3c56b703f8b3a8094356e94d494a7 [10906/11307] arm64: dts: qcom: sm7225-fairphone-fp4: Enable USB audio offload support
config: arm64-randconfig-051-20250718 (https://download.01.org/0day-ci/archive/20250719/202507191215.XtOfM64r-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250719/202507191215.XtOfM64r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507191215.XtOfM64r-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dtb: service@4 (qcom,q6afe): Unevaluated properties are not allowed ('usbd' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/qcom,q6afe.yaml#
>> arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dtb: /sound: failed to match any schema with compatible: ['fairphone,fp4-sndcard']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
