Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FAF0286890
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Dec 2025 23:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766704436; cv=none; b=bfpKWLiN1EbZDz5vVnSjh+ahckkvQHkNeZY7VxRe99XOR+8wgtmznquM4JhPi2FjawDIpDFbhjz3B1G7EmMNSLqaVRqqr0c6IL3rcpAtUAufcT/ljRrRNB++XwuD3ZBUlooGocqBGif6hMZiV1TL5vRnhJENMpV/iBYsJc9CccQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766704436; c=relaxed/simple;
	bh=oH1DWIFIecAA2EQvNWnKhV/Mi9721RQplJazbktpVaE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Q2wEdFisVswkc+6tVcLOsJANXorCTEWKuixvOiNyV9eYGmJo2e7WVvX3ODf2JkQKRaxGJGyF7zjg+AY8S3tZ4ZIHGemg0WIr7v55RGu5hqxGM1NZ2+1j+9MhElijCtVKK7HSPQrIA60/5X5I4drMa8X41+J2Ber/WuX1kGd0rs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c0Lo4U38; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c0Lo4U38"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766704435; x=1798240435;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=oH1DWIFIecAA2EQvNWnKhV/Mi9721RQplJazbktpVaE=;
  b=c0Lo4U38wO4eZcbE3ZOYrYgfzDsiNy2rzCGDBm6UtjRdG7NrcXn37mhs
   ZgW+AI0b7HYYYunYTl97Vv0nWFdiJOypm8TK3XzNumgOtkKVvMjEwEd/Z
   xkEQHN+drmLJqOiTqN6xK3UxMd1OCBKkzicqnW9eUWNy4GdnQkHf9PrG2
   weGqQTYXq6VgP4eqEYRMIHdM8kQkubfMUCvprIn/1H3bUMVPe/z13mvZq
   zBHvv0kZ+yuRbbl53nxvQO2PXNBbRYjUg5q6kdYz7T9nN6q01fXKns+NN
   1Tc8CPtu9dnop6gILMuSjPG2eS0PByfuSpLbAcDQdVmGw8U+B9L6W+4lv
   w==;
X-CSE-ConnectionGUID: swKq5yexT8aw9S/oBMyrhw==
X-CSE-MsgGUID: z1O3hoWJQsSBuZjCxbFrug==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="85902897"
X-IronPort-AV: E=Sophos;i="6.21,177,1763452800"; 
   d="scan'208";a="85902897"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2025 15:13:54 -0800
X-CSE-ConnectionGUID: Xyr4oKEnTS60sJ6DyWcmpw==
X-CSE-MsgGUID: O+eVfmlXT5ydOZ2o7/Bjrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,177,1763452800"; 
   d="scan'208";a="237682055"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 25 Dec 2025 15:13:53 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYuWk-000000004Wb-1ia3;
	Thu, 25 Dec 2025 23:13:50 +0000
Date: Fri, 26 Dec 2025 07:13:44 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-pie-v3 1/15] .tmp_vmlinux0.kallsyms.S:542: Error:
 can't resolve `_text' {*UND* section} - =?us-ascii?Q?`L0=01'?= {.rodata
 section}
Message-ID: <202512260721.ClhdOPIq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: application/octet-stream
Content-Transfer-Encoding: base64

dHJlZTogICBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9h
cmRiL2xpbnV4LmdpdCB4ODYtcGllLXYzCmhlYWQ6ICAgZGU2ZDkxOWYxZGVmZWE5MGFmNmMzMTQ3
OWM4YzljNjZhZjY4MTBkZQpjb21taXQ6IGE5NzE1MzU2MDc0MWM3Y2M0NDhlZTg2MjY4MmRlMmI2
ODIzOWI1M2IgWzEvMTVdIGthbGxzeW1zOiBVc2UgYSByZWxhdGl2ZSBvZmZzZXQgZm9yIHRoZSBy
ZWxhdGl2ZSBiYXNlCmNvbmZpZzogeHRlbnNhLXJhbmRjb25maWctcjA3Mi0yMDI1MTIyNiAoaHR0
cHM6Ly9kb3dubG9hZC4wMS5vcmcvMGRheS1jaS9hcmNoaXZlLzIwMjUxMjI2LzIwMjUxMjI2MDcy
MS5DbGhkT1BJcS1sa3BAaW50ZWwuY29tL2NvbmZpZykKY29tcGlsZXI6IHh0ZW5zYS1saW51eC1n
Y2MgKEdDQykgOC41LjAKcmVwcm9kdWNlICh0aGlzIGlzIGEgVz0xIGJ1aWxkKTogKGh0dHBzOi8v
ZG93bmxvYWQuMDEub3JnLzBkYXktY2kvYXJjaGl2ZS8yMDI1MTIyNi8yMDI1MTIyNjA3MjEuQ2xo
ZE9QSXEtbGtwQGludGVsLmNvbS9yZXByb2R1Y2UpCgpJZiB5b3UgZml4IHRoZSBpc3N1ZSBpbiBh
IHNlcGFyYXRlIHBhdGNoL2NvbW1pdCAoaS5lLiBub3QganVzdCBhIG5ldyB2ZXJzaW9uIG9mCnRo
ZSBzYW1lIHBhdGNoL2NvbW1pdCksIGtpbmRseSBhZGQgZm9sbG93aW5nIHRhZ3MKfCBSZXBvcnRl
ZC1ieToga2VybmVsIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+CnwgQ2xvc2VzOiBodHRwczov
L2xvcmUua2VybmVsLm9yZy9vZS1rYnVpbGQtYWxsLzIwMjUxMjI2MDcyMS5DbGhkT1BJcS1sa3BA
aW50ZWwuY29tLwoKQWxsIGVycm9ycyAobmV3IG9uZXMgcHJlZml4ZWQgYnkgPj4pOgoKICAgLnRt
cF92bWxpbnV4MC5rYWxsc3ltcy5TOiBBc3NlbWJsZXIgbWVzc2FnZXM6Cj4+IC50bXBfdm1saW51
eDAua2FsbHN5bXMuUzo1NDI6IEVycm9yOiBjYW4ndCByZXNvbHZlIGBfdGV4dCcgeypVTkQqIHNl
Y3Rpb259IC0gYEwwAScgey5yb2RhdGEgc2VjdGlvbn0KCktjb25maWcgd2FybmluZ3M6IChmb3Ig
cmVmZXJlbmNlIG9ubHkpCiAgIFdBUk5JTkc6IHVubWV0IGRpcmVjdCBkZXBlbmRlbmNpZXMgZGV0
ZWN0ZWQgZm9yIENBTl9ERVYKICAgRGVwZW5kcyBvbiBbbl06IE5FVERFVklDRVMgWz1uXSAmJiBD
QU4gWz1tXQogICBTZWxlY3RlZCBieSBbbV06CiAgIC0gQ0FOIFs9bV0gJiYgTkVUIFs9eV0KCi0t
IAowLURBWSBDSSBLZXJuZWwgVGVzdCBTZXJ2aWNlCmh0dHBzOi8vZ2l0aHViLmNvbS9pbnRlbC9s
a3AtdGVzdHMvd2lraQo=
