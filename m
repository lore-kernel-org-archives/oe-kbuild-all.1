Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFCF0190053
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Aug 2024 12:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724155239; cv=none; b=lx+ke9VRFm6NMnvPqdBH0zLPmCobfkT+ivCOFxwGDnW3pxrn6wa5F2Yt4OrAXZ91vHt8nJXw22iRXvCRRJO4e78R8tSkPkRRNG7tboSTsfzI0jqqoW3RlwOEjhOgg/p7N1c3eDeOeRB8TvsYeUOtvQJWvdpnwE0eCCyO1Bbxz/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724155239; c=relaxed/simple;
	bh=6xRwez9p6A8OTK3sTUlzOS+oCs0A8U3HgErkNBirTfU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fWtJGzykZJiCT+Hpgt6pkOeomX9K9EN5NxaY7DseGHTKkjrYxF7XpB1ZcrAZGsYd0lmLsrcwatMyFk49MiqPdBVJsFu5QD1V3/2fbFXrsj6RsGGlLn97n6TTwZERj8HL5H8XSXSZy9hiuOh3HwILw6nUsxSSy2epPkBwal+W1QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DpUzbWAA; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DpUzbWAA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724155235; x=1755691235;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6xRwez9p6A8OTK3sTUlzOS+oCs0A8U3HgErkNBirTfU=;
  b=DpUzbWAA5hyf9ROsmJj5EP1dielztN+5lAcWKYZAm71PQX6hT3hP3Rs5
   UvtyMUt+sk0K3KGCL/9h/Vce5LNMJD4vnZ6PDCyMKmDDTeE7vhLz4zBRU
   BBnXkjoQR0YuopaPuHyvI6+gRuR4P+hiOZiN7CuxafBJZQl8yGbdhotbj
   Y8hswUny8t/9yxOFXw1MlhAY0ODxH4oTKeJsg9WZ1gZu1Hj+HDahFc+sX
   bwDoPuo2GSMLRlH8c2BwbNkCRfyjJVsHJ2a9dl3ECkhvX4NGlq/XC4NXu
   njlv1W5AhkFfPZcEJGqnhA6+BVajl2cKJ3zufgmSIk5yDlHrgrOe7jh/S
   g==;
X-CSE-ConnectionGUID: iAhFq+sCQXKGDLJdoHL3TA==
X-CSE-MsgGUID: lAtu35waSnmJS1dZp8YO0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="22578651"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; 
   d="scan'208";a="22578651"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 05:00:33 -0700
X-CSE-ConnectionGUID: Jstg5d3qRzmCrww6gGvD1A==
X-CSE-MsgGUID: WfsL8fkpTnydUE7cVzCgHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; 
   d="scan'208";a="65068361"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 20 Aug 2024 05:00:32 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sgNXJ-000A8Y-2W;
	Tue, 20 Aug 2024 12:00:29 +0000
Date: Tue, 20 Aug 2024 19:59:52 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Subject: [linux-next:master 5236/5508]
 arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: bluetooth:
 'vddaon-supply' is a required property
Message-ID: <202408201923.Wt2cbD7C-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   bb1b0acdcd66e0d8eedee3570d249e076b89ab32
commit: 0553b3a4ef28517c7b26b817c89515955ffa3ec5 [5236/5508] dt-bindings: bluetooth: bring the HW description closer to reality for wcn6855
config: arm64-randconfig-052-20240820 (https://download.01.org/0day-ci/archive/20240820/202408201923.Wt2cbD7C-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 26670e7fa4f032a019d23d56c6a02926e854e8af)
dtschema version: 2024.6.dev10+ge5d88ac
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240820/202408201923.Wt2cbD7C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408201923.Wt2cbD7C-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: bluetooth: 'vddaon-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: bluetooth: 'vddwlcx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: bluetooth: 'vddwlmx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: bluetooth: 'vddbtcmx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: bluetooth: 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
