Received: from omta038.useast.a.cloudfilter.net (omta038.useast.a.cloudfilter.net [44.202.169.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B5D30C61F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 May 2026 17:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.202.169.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778606742; cv=none; b=nTFy6tlGyeKIxVhGnzNCGRmdzuy8lcrW+0WxufoWrQl9kj7ZOlTjSqsHiaVcbJrGMsJ2FZqCvCSHFTP8eOnms/fLpIdQK3Xk1uxGa6zCegyp6J47OKrbJI29Zb7RALl6i6BQmurz9sCwHPmaOf+DV1juTJFfz8/JEkRowP8ApyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778606742; c=relaxed/simple;
	bh=nFbluiIDW2FpuftLpz99EDK3jvV6ZNqTABiWKDgX1mQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MZgpPwCHNy4w1SnFlB7hvQnoeHkT2xPouKcaa5FKVMJYAIc3xPJTC/HOkeOHLtwrO3hCDTEoIBA+41jJZKo1CcaOMs3JsEPntBJpa/8T7Xwli4Hq7tOrahaWMetKoxTDmnBkviNtBeuVkimgTb0ZnVgEFDbnpE3JMEJc6z3/iy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com; spf=pass smtp.mailfrom=embeddedor.com; dkim=pass (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b=tGE738nq; arc=none smtp.client-ip=44.202.169.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=embeddedor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b="tGE738nq"
Received: from eig-obgw-5006b.ext.cloudfilter.net ([10.0.29.217])
	by cmsmtp with ESMTPS
	id MPy7wBMn5uVXCMqrTwhyqU; Tue, 12 May 2026 17:25:39 +0000
Received: from gator4166.hostgator.com ([108.167.190.91])
	by cmsmtp with ESMTPS
	id MqrTwjQc1wILMMqrTwx7pB; Tue, 12 May 2026 17:25:39 +0000
X-Authority-Analysis: v=2.4 cv=F+RXdrhN c=1 sm=1 tr=0 ts=6a036293
 a=vY9Mjuda9oMEc2E4Cx1x2A==:117 a=vY9Mjuda9oMEc2E4Cx1x2A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=7T7KSl7uo7wA:10
 a=Gu3GiEoUUHqbJlZtdjIA:9 a=QEXdDO2ut3YA:10 a=2aFnImwKRvkU0tJ3nQRT:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=nFbluiIDW2FpuftLpz99EDK3jvV6ZNqTABiWKDgX1mQ=; b=tGE738nqgQ9tQlWze/NOGRpqvS
	u7fPGckk4IqoR/e1Oa2/O3ejz/xE7jaPwDqOBdaiEFl8+U0V8u6mphyVuJ1yROeA918/PHHduAu44
	yk+5ItM9M9WIwz2PV0c7pv5H8pLeLawuc7K/dVj8znMzP2rHHjnCkAp6UIO5djeTuPU4OVaSSibOd
	/RucRgo02NXksiozpfNEwXnWZi+zceoOcni2VxoG8StQW/qSpSRyKSjm311NzQtrPPObircunHm/t
	0Qbt0dCl87knFc/cTGV1ihnoOOT2HtziI0JHcox5A3jgv72aVDDLysWKOGRsIvgZDPt1UXDIq4qll
	lNang7VQ==;
Received: from [177.238.16.53] (port=44828 helo=[192.168.0.104])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.99.2)
	(envelope-from <gustavo@embeddedor.com>)
	id 1wMqrR-00000000QSq-37cg;
	Tue, 12 May 2026 12:25:38 -0500
Message-ID: <45a51f6f-b4e5-4a73-9ec2-f736b5132a93@embeddedor.com>
Date: Tue, 12 May 2026 11:24:33 -0600
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kees:for-next/hardening 1/1] htmldocs:
 Documentation/driver-api/basics:127: ./include/linux/stddef.h:110: WARNING:
 Definition list ends without a blank line; unexpected unindent. [docutils]
To: Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
 linux-doc@vger.kernel.org
References: <202605120507.9iQRMgKR-lkp@intel.com>
 <202605120755.4A2AC441EB@keescook>
Content-Language: en-US
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <202605120755.4A2AC441EB@keescook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 177.238.16.53
X-Source-L: No
X-Exim-ID: 1wMqrR-00000000QSq-37cg
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.0.104]) [177.238.16.53]:44828
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 2
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfPCZwraHmiw2CUOL6cY+DjIDU0g6ETfW3JF/IXY1lPU51j0bhxWVae6lNizLRfIP0cRM9SfVG5stAXk58MmqN0q0FE5tDhqkUvReerCoylYbcFT6WETd
 86YmWJ8W3Uy4N+zo2c63aZ2cMHjOrrPCI1kuI2+PDQ6Fk2FBWCOY6nFXEiibgXIVMAsVwd89tT8BJtmSRDjneNi8zeZgwKAMqwb/sBIzQEeO+LatA2sSs8/q


> Oh, hrm, there are a lot of errors in stddef.h for the "htmldocs" make
> target. Gustavo, can you see what's needed to fix these?

Sure thing. I saw that yesterday.

-Gustavo
