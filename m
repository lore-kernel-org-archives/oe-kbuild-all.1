Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3EDBD2FB
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Dec 2025 20:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766695637; cv=none; b=bVe4IEhDF1UN74JX0oyY16sfbUMk7SVYcAAP/a7u6L3myYSXUWbTofKx3f6MoM0ganoKJb3ogJXN44G+ior4TghJyUjKBKYZSwLMbouLL7dOaV2MZNgGBRac3ah7giy080GgMOGFKil6hrxQMkaN8ksVXvweg/SSDh74tYXOQKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766695637; c=relaxed/simple;
	bh=RXGVMDRcqOupkruNQwARhkMV/yMteA/PilEyALgBAlY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=na5K+imxTZW0TYAYuTI2i27Tk6ZCL0nua8nONkI1jIb0blQnK2Aq75zz2rG50/7wJP1z7oQcKczsNDAWvYALo7Ads0Nh5LSJ5FRCMfbr7wCfHn55JnUFLMytTJZ5pK4udVoyW9pZCqmhQhy6YMLCLIEoDlmqEwGWs2SMyoOBRIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lj+rn36K; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lj+rn36K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766695636; x=1798231636;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=RXGVMDRcqOupkruNQwARhkMV/yMteA/PilEyALgBAlY=;
  b=Lj+rn36Km06Juc2L9Ey/yiHUNEvXdr5Pg7pQAAOHXW4JAii/8vVK6sIV
   ozhA3q6eXTvZi1Mo9eURvMMxDj5ZIUIRq60Yq042lEe+XB6qTPXlpq/iX
   kU0p2YaPmvPM6nocvDbs0u10pXOtuJvkzAsGSLtxFl2SIkV9qZb/Y7G+V
   /rNEK0VJFwcZFn/mLXdPsAkm6XZ0X+dMaEHOEVK5LCPybrG6akmkF6V2R
   X0ui6IOUnn/xPXGRKtHTMQwIMX+hEPcXQW5gX4T2Y29ZZH8DgBf+oaZ8U
   JklL6p/FWJnKePz/pEljNgbS2RDZfZkVEu6qqPd7fKesTW51WorrsZkZd
   w==;
X-CSE-ConnectionGUID: qcTm1XreTMaym2IC8km6BA==
X-CSE-MsgGUID: hDb2DkjMSG2XisXCNC8ZqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="68373666"
X-IronPort-AV: E=Sophos;i="6.21,177,1763452800"; 
   d="scan'208";a="68373666"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2025 12:47:16 -0800
X-CSE-ConnectionGUID: cchd8WSqSZmpGCHwBE77zg==
X-CSE-MsgGUID: PPrwToQ5RjWVKOgOuoNsHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,177,1763452800"; 
   d="scan'208";a="237666401"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 25 Dec 2025 12:47:14 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYsEl-000000004S5-1yEu;
	Thu, 25 Dec 2025 20:47:07 +0000
Date: Fri, 26 Dec 2025 04:46:34 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-pie-v3 1/15] .tmp_vmlinux0.kallsyms.S:542: Error:
 can't resolve _text - =?us-ascii?B?TDAB?=
Message-ID: <202512260441.yGKmvX2z-lkp@intel.com>
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
cmRiL2xpbnV4LmdpdCB4ODYtcGllLXYzCmhlYWQ6ICAgMTZmODU4NDczZDkwY2ExZjUwY2Q3MDFm
Y2FhN2EzYTdkNThjNDRmNwpjb21taXQ6IGE5NzE1MzU2MDc0MWM3Y2M0NDhlZTg2MjY4MmRlMmI2
ODIzOWI1M2IgWzEvMTVdIGthbGxzeW1zOiBVc2UgYSByZWxhdGl2ZSBvZmZzZXQgZm9yIHRoZSBy
ZWxhdGl2ZSBiYXNlCmNvbmZpZzogbmlvczItYWxsbm9jb25maWcgKGh0dHBzOi8vZG93bmxvYWQu
MDEub3JnLzBkYXktY2kvYXJjaGl2ZS8yMDI1MTIyNi8yMDI1MTIyNjA0NDEueUdLbXZYMnotbGtw
QGludGVsLmNvbS9jb25maWcpCmNvbXBpbGVyOiBuaW9zMi1saW51eC1nY2MgKEdDQykgMTEuNS4w
CnJlcHJvZHVjZSAodGhpcyBpcyBhIFc9MSBidWlsZCk6IChodHRwczovL2Rvd25sb2FkLjAxLm9y
Zy8wZGF5LWNpL2FyY2hpdmUvMjAyNTEyMjYvMjAyNTEyMjYwNDQxLnlHS212WDJ6LWxrcEBpbnRl
bC5jb20vcmVwcm9kdWNlKQoKSWYgeW91IGZpeCB0aGUgaXNzdWUgaW4gYSBzZXBhcmF0ZSBwYXRj
aC9jb21taXQgKGkuZS4gbm90IGp1c3QgYSBuZXcgdmVyc2lvbiBvZgp0aGUgc2FtZSBwYXRjaC9j
b21taXQpLCBraW5kbHkgYWRkIGZvbGxvd2luZyB0YWdzCnwgUmVwb3J0ZWQtYnk6IGtlcm5lbCB0
ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPgp8IENsb3NlczogaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvb2Uta2J1aWxkLWFsbC8yMDI1MTIyNjA0NDEueUdLbXZYMnotbGtwQGludGVsLmNvbS8KCkFs
bCBlcnJvcnMgKG5ldyBvbmVzIHByZWZpeGVkIGJ5ID4+KToKCiAgIC50bXBfdm1saW51eDAua2Fs
bHN5bXMuUzogQXNzZW1ibGVyIG1lc3NhZ2VzOgo+PiAudG1wX3ZtbGludXgwLmthbGxzeW1zLlM6
NTQyOiBFcnJvcjogY2FuJ3QgcmVzb2x2ZSBfdGV4dCAtIEwwAQoKLS0gCjAtREFZIENJIEtlcm5l
bCBUZXN0IFNlcnZpY2UKaHR0cHM6Ly9naXRodWIuY29tL2ludGVsL2xrcC10ZXN0cy93aWtpCg==
