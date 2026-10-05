Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51AAE154425
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Oct 2026 02:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791166757; cv=none; b=r+MOcwSfUREZeEYSeydB92r2jcfOcbx5gsbgpda5WZRtLTLLnDrFofL2BuwXRcBj3RvmH0nJkOP5LrRGC69Q6FzY3aL+60o2YUaPHO6IU5RT6VLQIW4OjggWVsUoHPEWuB0YFZOLPJ5pd08sR2/MZZove9LfYT+tMpGeuinwaCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791166757; c=relaxed/simple;
	bh=+EBS4GeoywoZ8784YpuKH41JG+dSEuMKa4FFt3zoWdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Y8afLI4hZO4/TzkjgJO8T2zanCOPHcQUZmhRhR7pBGX7WStJZsaEpaCPxGV02ibrlJ5J9vSV/dOz0OMSo9visZOjTBBOFqKNITgPYYbrle7bHUBemNW1hqmUONFcdRhaDo0i76BWdV3ImdkZsURq/XqQ4zCm1bBAvAIdxrNikqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kXmYvDnG; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kXmYvDnG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791166756; x=1822702756;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=+EBS4GeoywoZ8784YpuKH41JG+dSEuMKa4FFt3zoWdQ=;
  b=kXmYvDnGG3Mr+OGUjzS+2pfvnjwKx5DN2RpSfzWLcPu9l6D5QDjYmlsI
   JK10wPlMQXCthGaPjbkb8bL3YOObU5Ha5Yocnapx4SXNPV807GjYJT/vq
   Plm6fVJMNEvbbH88DYw0BkGiBuV4WyuamTA8eEnR3WTxuA1l//3afXkpj
   VIiWSk6HBoe1LAZq9Tm31BO8d5mHZYF4k+3qvprMUfQc5MKRB37Ka2KM+
   66tUjbbHRDYGR8LHApqnrzSBTS8218Qpz03EYJJlGpNpXHAdcXJQsSHuL
   ju9kBlPQhR3GtdP3Xkg4RaoShPG397zM5SHLeW9mHoDfjEAClY6GSM7qY
   A==;
X-CSE-ConnectionGUID: peTao+aKRWy5nN7kkiUVBA==
X-CSE-MsgGUID: 2EbZVSYTQfOLWed47v4AzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="102349852"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="102349852"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2026 19:19:15 -0700
X-CSE-ConnectionGUID: r4f5//iMS2i+xvj9KmAhWQ==
X-CSE-MsgGUID: XD7E2HwrTnCuqR2s+zw/7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="276781138"
Received: from igk-lkp-server01.igk.intel.com (HELO 3a02ec7efc9f) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 04 Oct 2026 19:19:14 -0700
Received: from kbuild by 3a02ec7efc9f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDYIJ-000000000Wd-1rh6;
	Mon, 05 Oct 2026 02:19:11 +0000
Date: Mon, 05 Oct 2026 04:18:44 +0200
From: kernel test robot <lkp@intel.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: reset-rzg2l-usbphy-ctrl.c:undefined reference to
 `pwrseq_enable'
Message-ID: <202610050445.WP4OvIgZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: application/octet-stream
Content-Transfer-Encoding: base64

dHJlZTogICBodHRwczovL2dpdGh1Yi5jb20vaW50ZWwtbGFiLWxrcC9saW51eC9jb21taXRzL0Jp
anUvcmVndWxhdG9yLXJlbmVzYXMtdXNiLXZidXMtcmVndWxhdG9yLVJlbmFtZS1wbGF0Zm9ybS1k
ZXZpY2UtdG8tcnpnMmwtdmJ1cy1yZWd1bGF0b3IvMjAyNjEwMDItMTIxNjU2CmhlYWQ6ICAgZTYw
MThlNTMxMzEyYzBhNTliYjBiNjU0MDE0MTI4NTQwNTcwMjcwNwpjb21taXQ6IDcxZGQ0YTFkODk0
M2I4YzA1Y2M4OGEzNGIxNjJhMmVhY2QzYWJhNDYgcmVzZXQ6IHJ6ZzJsLXVzYnBoeS1jdHJsOiBB
ZGQgUlovRzNMIHN1cHBvcnQKZGF0ZTogICAyIGRheXMgYWdvCmNvbmZpZzogbG9vbmdhcmNoLXJh
bmRjb25maWctcjIzMDYtMjAyNjEwMDQgKGh0dHBzOi8vZG93bmxvYWQuMDEub3JnLzBkYXktY2kv
YXJjaGl2ZS8yMDI2MTAwNS8yMDI2MTAwNTA0NDUuV1A0T3ZJZ1otbGtwQGludGVsLmNvbS9jb25m
aWcpCmNvbXBpbGVyOiBsb29uZ2FyY2g2NC1saW51eC1nY2MgKEdDQykgMTQuMy4wCnNwYXJzZTog
djAuNi41LXJjMQpyZXByb2R1Y2UgKHRoaXMgaXMgYSBXPTEgYnVpbGQpOiAoaHR0cHM6Ly9kb3du
bG9hZC4wMS5vcmcvMGRheS1jaS9hcmNoaXZlLzIwMjYxMDA1LzIwMjYxMDA1MDQ0NS5XUDRPdkln
Wi1sa3BAaW50ZWwuY29tL3JlcHJvZHVjZSkKCklmIHlvdSBmaXggdGhlIGlzc3VlIGluIGEgc2Vw
YXJhdGUgcGF0Y2gvY29tbWl0IChpLmUuIG5vdCBqdXN0IGEgbmV3IHZlcnNpb24gb2YKdGhlIHNh
bWUgcGF0Y2gvY29tbWl0KSwga2luZGx5IGFkZCBmb2xsb3dpbmcgdGFncwp8IFJlcG9ydGVkLWJ5
OiBrZXJuZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4KfCBDbG9zZXM6IGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL29lLWtidWlsZC1hbGwvMjAyNjEwMDUwNDQ1LldQNE92SWdaLWxrcEBpbnRl
bC5jb20vCgpBbGwgZXJyb3JzIChuZXcgb25lcyBwcmVmaXhlZCBieSA+Pik6CgogICBsb29uZ2Fy
Y2g2NC1saW51eC1sZDogZHJpdmVycy9yZXNldC9yZXNldC1yemcybC11c2JwaHktY3RybC5vOiBp
biBmdW5jdGlvbiBgcnpnMmxfdXNicGh5X2N0cmxfcmVzdW1lJzoKPj4gcmVzZXQtcnpnMmwtdXNi
cGh5LWN0cmwuYzooLnRleHQrMHg1NzApOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBwd3JzZXFf
ZW5hYmxlJwogICBsb29uZ2FyY2g2NC1saW51eC1sZDogZHJpdmVycy9yZXNldC9yZXNldC1yemcy
bC11c2JwaHktY3RybC5vOiBpbiBmdW5jdGlvbiBgcnpnMmxfdXNicGh5X2N0cmxfcHJvYmUnOgo+
PiByZXNldC1yemcybC11c2JwaHktY3RybC5jOigudGV4dCsweDc2OCk6IHVuZGVmaW5lZCByZWZl
cmVuY2UgdG8gYGRldm1fcHdyc2VxX2dldCcKPj4gbG9vbmdhcmNoNjQtbGludXgtbGQ6IHJlc2V0
LXJ6ZzJsLXVzYnBoeS1jdHJsLmM6KC50ZXh0KzB4NzljKTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0
byBgcHdyc2VxX2VuYWJsZScKICAgbG9vbmdhcmNoNjQtbGludXgtbGQ6IGRyaXZlcnMvcmVzZXQv
cmVzZXQtcnpnMmwtdXNicGh5LWN0cmwubzogaW4gZnVuY3Rpb24gYC5MMTAwMDECMSc6Cj4+IHJl
c2V0LXJ6ZzJsLXVzYnBoeS1jdHJsLmM6KC50ZXh0KzB4OWM4KTogdW5kZWZpbmVkIHJlZmVyZW5j
ZSB0byBgcHdyc2VxX2Rpc2FibGUnCgotLQowLURBWSBDSSBLZXJuZWwgVGVzdCBTZXJ2aWNlCmh0
dHBzOi8vZ2l0aHViLmNvbS9pbnRlbC9sa3AtdGVzdHMvd2lraQo=
