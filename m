Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F53518EB1
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 May 2024 20:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716235336; cv=none; b=FDezsRRHeElndurC5/gtwqxsahZH6mZVXa+AML1WGL0ZmarkbpxBKBPqPeObP7q+KuipIrKsNhqtiMXAKFoaL39EJ3G0ssydPgqCCOlKmy0jg1zNBHNbrBb1T4A4V99HXZUNzpjDntOBV8F5sxTPbHgPM6JL08TLl2vx0oHg7GA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716235336; c=relaxed/simple;
	bh=sWkNXuhCd32L8emFQEh1WCFjw6OxGCBqI0e7fVpBgpk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RIX3GRSNl7QCIgrXyfCg8Aq+pX1oWDfuGGE/i5zw+M+NIxstX1KeujiQNZJtZmkLL8j1TIKVpdWEHpQHbcV4WgzUPAk2N+n0MqIsZflYDIpDGaYBiN7zjEKpcwssRZWiS+om4JR1oFEeyvwxRtGWtGRpJDNMd8Z0KEFBzr12rVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MpVCNJ4o; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MpVCNJ4o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716235335; x=1747771335;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sWkNXuhCd32L8emFQEh1WCFjw6OxGCBqI0e7fVpBgpk=;
  b=MpVCNJ4opTFk+RLdj1KUX1Gu/1Ny7AjhBLwQ6YU6tAmfIYx6duuX2blO
   Ez/LtKLW06YwOX+oADokCVFBFV27pEy+fXq8rzKzfg2z3mXGP4kkV6iNp
   2MUVPTm4OkXcpG77mCirnZyL8Fm3nrFzC+6b8psEaXQVXRBoXHksxGI1T
   OF8I89BUqmCb2rMUkfiiiNAoeH8zhZvSXGgv/+p0Plx8Dvc80g0QtcYCh
   mL4Qy74kcn+rl7mzT+UGWKSgV3rXXz8F80yZ9wlb3VAmKxNzqX6teT+t5
   7Ve7SJn4cSAKo8tVDXlGxB9XOBxltycNoO5/iGs18tjOOvW2mNb1hqYb7
   g==;
X-CSE-ConnectionGUID: rojBlDMrSgOZfzdSh/ibUQ==
X-CSE-MsgGUID: +MSUQlgyQ9G77/OQvZCvZw==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="12329022"
X-IronPort-AV: E=Sophos;i="6.08,176,1712646000"; 
   d="scan'208";a="12329022"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2024 13:02:07 -0700
X-CSE-ConnectionGUID: S/wkr56HSlC9ILgW2HGSXg==
X-CSE-MsgGUID: TKhvlw8YSaSk4R55DyGx/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; 
   d="scan'208";a="32527241"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 20 May 2024 13:02:06 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s99Co-000570-0P;
	Mon, 20 May 2024 20:01:59 +0000
Date: Tue, 21 May 2024 04:01:27 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 11/11] dtbs_check:
 Documentation/devicetree/bindings/iio/proximity/tyhx,hx9031as.yaml:60:1:
 [warning] too many blank lines (6 > 1) (empty-lines)
Message-ID: <202405210326.8W4CSQVV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   1e62601a4063ba2c401b8783ed3b6d7964e3ff90
commit: 1e62601a4063ba2c401b8783ed3b6d7964e3ff90 [11/11] FROMLIST: dt-bindings:iio:proximity: Add hx9031as binding
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project fa9b1be45088dce1e4b602d451f118128b94237b)
dtschema version: 2024.5.dev3+g8733c90
reproduce: (https://download.01.org/0day-ci/archive/20240521/202405210326.8W4CSQVV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405210326.8W4CSQVV-lkp@intel.com/

All errors (new ones prefixed by >>):

   Documentation/devicetree/bindings/media/mediatek-mdp3.yaml:20:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
   Documentation/devicetree/bindings/media/mediatek-mdp3.yaml:22:11: [warning] wrong indentation: expected 12 but found 10 (indentation)
   Documentation/devicetree/bindings/media/mediatek-mdp3.yaml:24:11: [warning] wrong indentation: expected 12 but found 10 (indentation)
   Documentation/devicetree/bindings/media/mediatek-mdp3.yaml:27:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
   Documentation/devicetree/bindings/media/mediatek-mdp3.yaml:29:11: [warning] wrong indentation: expected 12 but found 10 (indentation)
   Documentation/devicetree/bindings/media/mediatek-mdp3.yaml:136:11: [warning] wrong indentation: expected 12 but found 10 (indentation)
   Documentation/devicetree/bindings/media/mediatek-mdp3.yaml:138:11: [warning] wrong indentation: expected 12 but found 10 (indentation)
>> Documentation/devicetree/bindings/iio/proximity/tyhx,hx9031as.yaml:60:1: [warning] too many blank lines (6 > 1) (empty-lines)


vim +60 Documentation/devicetree/bindings/iio/proximity/tyhx,hx9031as.yaml

    39	
    40	examples:
    41	  - |
    42	    #include <dt-bindings/interrupt-controller/irq.h>
    43	    i2c {
    44	      #address-cells = <1>;
    45	      #size-cells = <0>;
    46	      hx9031as@2a {
    47	        compatible = "tyhx,hx9031as";
    48	        reg = <0x2a>;
    49	        interrupt-parent = <&pio>;
    50	        interrupts = <16 IRQ_TYPE_EDGE_FALLING 16 0>;
    51	        vdd-supply = <&pp3300_a>;
    52	        status = "okay";
    53	      };
    54	    };
    55	
    56	
    57	
    58	
    59	
  > 60	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
