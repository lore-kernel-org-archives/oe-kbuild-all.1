Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0E22B9B7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 May 2025 02:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747879833; cv=none; b=M/qiNB2eIBIYu0WIxcmukzdNbASuqmtO96UzeTPfVJLjCwZuNpb/M1+dKS3soyGouBhJS6HeCU2N9P7f29LKPGBsyrQ+Gpd11Pu+BWrR3d+PYKMFNyrPdUWPtnP9/UyJh8N5HrlZ1fedAym7R53VQhOa8GDSHBL9Xdo0nAHA9RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747879833; c=relaxed/simple;
	bh=YnWc4SMwOswQNzMGVO31apXlKTXb/r9IdF6v2ED8XGM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=YMmjFYMccdlYskoe6QzR9Xgvzg3ebqbjImsJFzvgRPsD4AMJZDf7y7aOj/1uxU8Djd8Oywj9IHg/UO6kaZdiNiU++JMop3LQIPZQwkF7Z9YbXjVPEu7rjGByAiq/t2eF2ZkDhijJsG8W5NJYPlztz3r+1no0ndSSVppJO/dV5Ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=Q3BUrcfh; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="Q3BUrcfh"
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 9B6802C04C9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 May 2025 14:02:27 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1747879347;
	bh=YnWc4SMwOswQNzMGVO31apXlKTXb/r9IdF6v2ED8XGM=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:Reply-To:From;
	b=Q3BUrcfhtCmz+jTBZ4SuCkimOzpCy0OHEGcesnjkNYNajS0lvRoYYBVHk9Ms4i3SO
	 fl2zvzq3jodHfp4D7p/BtZ+Tp34UKYioDzAxduC2dvrSYt7e1Nb8LxkNmBapZLKGDq
	 uCHA2SCqzfVSLnZCyDfZonsekQvwSdUvrW0UBTrSE9Mq2PqDolovZgtj4Qx2epl91x
	 QVgvVBJKUMXKza1Yj5CIjGT+NiqIlCMXSW4sJECj3Bg/7mO9W+RCrGfVjwmM/AnF82
	 hV1cHCEvVS1fCXS9kKegOK4vm5jz87WD9hPuPRehWwHb1R7r3+Y6M6RNAa9adEd944
	 frqx0GT/MOpYg==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B682e85b30000>; Thu, 22 May 2025 14:02:27 +1200
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 22 May 2025 14:02:27 +1200
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1544.014; Thu, 22 May 2025 14:02:27 +1200
From: Aryan Srivastava <Aryan.Srivastava@alliedtelesis.co.nz>
To: "andi.shyti@kernel.org" <andi.shyti@kernel.org>
CC: "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>
Subject: Re: [linux-next:master 3986/6092]
 drivers/i2c/busses/i2c-octeon-core.c:731:23: sparse: sparse: incorrect type
 in argument 1 (different base types)
Thread-Topic: [linux-next:master 3986/6092]
 drivers/i2c/busses/i2c-octeon-core.c:731:23: sparse: sparse: incorrect type
 in argument 1 (different base types)
Thread-Index: AQHbv1gZmOhQIcxk5Um9n/YNIeJwdbPdM0eA
Date: Thu, 22 May 2025 02:02:27 +0000
Message-ID: <adf4cf8a97aef9374db7a728b7a065a6579fc684.camel@alliedtelesis.co.nz>
References: <202505072140.30QBc5bv-lkp@intel.com>
In-Reply-To: <202505072140.30QBc5bv-lkp@intel.com>
Reply-To: "202505072140.30QBc5bv-lkp@intel.com"
	<202505072140.30QBc5bv-lkp@intel.com>
Accept-Language: en-US, en-NZ
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <4A7CC93A2CAD5340AF3C046A19EEB763@alliedtelesis.co.nz>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=KLP5D0Fo c=1 sm=1 tr=0 ts=682e85b3 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=w1vUsAckAk8A:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=XcTEIVs4g8wmXigB5_wA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0

DQpIaSBBbmRpLA0KDQpXaGljaCB0cmVlIHNob3VsZCBJIG1ha2UgbXkgcGF0Y2ggYWdhaW5zdCBm
b3IgdGhpcyBpc3N1ZSAoaTJjLWhvc3QsDQppMmMtaG9zdC1maXhlcyBvciBqdXN0IHN0cmFpZ2h0
IHRvIHRoZSBsYXRlc3Qga2VybmVsKT8NCg0KVGhhbmtzLA0KQXJ5YW4NCg==
