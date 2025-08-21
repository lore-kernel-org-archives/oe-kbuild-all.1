Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E58C2D9788
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Aug 2025 09:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755770003; cv=none; b=HemCdHqb0YWTtwhXIDTPUPbUusH2ZUaJwnBvAIwp3J+Co0J4JKzwWYdlpMLhM5uQgWU0I9sDclQsm5ZCn8TcRulwOatk8BVyCuh16V/3/8jwwR4Qcbp2GCWKsovJONz+aDpsBbIm+ZN+bC0h8CE7ojUVnxYS/VdDJPseKPij1Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755770003; c=relaxed/simple;
	bh=UzJBO8sITaqSq4Tz2jRF5YdNlCPVLgbvAWTyYwHZBmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HqEdIpa1kkf9YDQ4ouZgAKnvrSGN2JzUcLVlk2hvBfRoeZ0ktkemP2ekz4lhqfxcX+4W6twjEk+ArBNW0d3kCH216F0lbD+41Q+aBKuzZ1c5ejjJKzJLXXeW5L53KeLDOVku/Qmi3Fe1BsNvLoYjUJrcj9aLXvgJXqaiPI9M7X4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LOuhpKOe; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LOuhpKOe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755770002; x=1787306002;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UzJBO8sITaqSq4Tz2jRF5YdNlCPVLgbvAWTyYwHZBmQ=;
  b=LOuhpKOewn1B/SG4vuYrPApvtEMVB9mCkThdUcewhFNKiqfT8iLiGlRT
   Bhl3mozpr5R27b+OcMBqo5hWQKZUKR3aS9R+HOrnMKmafOQOGoyNPJC4d
   nd0DQiz5B9bJTVeuB9Zle1dzoCt/KXRhnAld3skMSie/+ZyuVrcN9nndu
   iYMnhMvsZfaunUYQMQgE/akfiIi0h6slPHK55KklojvBVmZn5yvG8iO3G
   OObm1UVYOPKqrkS1iQsVlo+R2bFAYFE8wln0sm2VFmFJbHJVOiuwKK+Fg
   3Y4fhyDI5dpJBftPxt1ugo0/iEtq/aBgQDxWfC3LGv46Uk5BuXyiNrkGn
   w==;
X-CSE-ConnectionGUID: ksdjESVXRqWCw5yumrZhcA==
X-CSE-MsgGUID: uCOBpe29S9y/6NlMYEbtNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="75503402"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="75503402"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 02:53:22 -0700
X-CSE-ConnectionGUID: vvqFNzQ0R5uhZUlhSiPc6A==
X-CSE-MsgGUID: mUxzKZi6QrCGCZGA2czU3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="172617802"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by fmviesa005.fm.intel.com with ESMTP; 21 Aug 2025 02:53:20 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1up1yv-0001il-2v;
	Thu, 21 Aug 2025 09:53:17 +0000
Date: Thu, 21 Aug 2025 11:53:13 +0200
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [krzk-github:b4/dt-bindings-display 7/7] htmldocs: Warning:
 Documentation/devicetree/bindings/pwm/google,cros-ec-pwm.yaml references a
 file that doesn't exist:
 Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
Message-ID: <202508211155.bEvXYKpB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux b4/dt-bindings-display
head:   6c8e41c23e9a77b2d17170b3fbf527f23f453dec
commit: 6c8e41c23e9a77b2d17170b3fbf527f23f453dec [7/7] dt-bindings: mfd: Move embedded controllers to own directory
reproduce: (https://download.01.org/0day-ci/archive/20250821/202508211155.bEvXYKpB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508211155.bEvXYKpB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/userspace-api/netlink/netlink-raw.rst: :doc:`rt-link<../../networking/netlink_spec/rt-link>`
   Documentation/userspace-api/netlink/netlink-raw.rst: :doc:`tc<../../networking/netlink_spec/tc>`
   Documentation/userspace-api/netlink/netlink-raw.rst: :doc:`tc<../../networking/netlink_spec/tc>`
>> Warning: Documentation/devicetree/bindings/pwm/google,cros-ec-pwm.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt references a file that doesn't exist: Documentation/devicetree/bindings/gpio/gpio-dsp-keystone.txt
>> Warning: Documentation/devicetree/bindings/sound/google,cros-ec-codec.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
   Warning: Documentation/hwmon/g762.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/g762.txt
   Warning: Documentation/trace/rv/da_monitor_instrumentation.rst references a file that doesn't exist: Documentation/trace/rv/da_monitor_synthesis.rst
   Warning: Documentation/translations/ja_JP/SubmittingPatches references a file that doesn't exist: linux-2.6.12-vanilla/Documentation/dontdiff
   Warning: Documentation/translations/ja_JP/process/submit-checklist.rst references a file that doesn't exist: Documentation/translations/ja_JP/SubmitChecklist
   Warning: Documentation/translations/zh_CN/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
