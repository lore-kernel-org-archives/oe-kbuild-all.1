Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E0123F287
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Jan 2025 20:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737059311; cv=none; b=kceYf5WOnpSaHEsxK1zryg0V8FFQeO/nb7kMeOl+BMzuxlTChYCgT2rQBX8Zt7i7lKyxLVfSeHRUOogAvhMUE84onzSTSqPu0fsyunpvIfeC+6wG3+ruiVOgTByJ+Rp0JPRBU684IXXnCyy328hyT77Td3XcJV0i0HhdtGbyOVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737059311; c=relaxed/simple;
	bh=fQwPh6wRgWWAW/byRvTA531AMQYGviYwGkxhxMw8V4Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nC28cYZXwlgsGZboDPX5tYbBpIcO8E/eHafrtFgNjXRYzNnedID9ImQQTNKbp6dgBWNAzDDhPfNyhmNnVdkcLXrNebnh2KxYTLQG1oO2JtT8HpH+s5GRMkSdb3HppwhD1Lbon02l/kFMV+cu1vN3ciDJDSLuwZxioWZK8wfTpsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=m5vGv9v5; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="m5vGv9v5"
Message-ID: <d71b0a61-4848-4394-a3d1-c16d1dbee49a@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1737059296;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SfI2RUC7Fb0xz5/keho+71pE1bNdG/5badPFv4rubtk=;
	b=m5vGv9v5Ands8h3wQ5LMVP8R0FoGBImBqsfcl2wTWYJC3ok+YqiZdpjJKUlpXN5U/pQMvx
	UxbLcnC0yENoBSkIcFnDjFzW7CEYJDoPfh3PKD2zqlUfVQTQ50GwyRcSmEb7F7qOYMFizN
	vdGzObQVxdMfrmHRa2o+T1rzX6EuWdA=
Date: Thu, 16 Jan 2025 15:28:11 -0500
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: drivers/gpu/drm/xlnx/zynqmp_dp.c:2312:46: warning: 'snprintf'
 output may be truncated before the last format character
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
References: <202501170447.kNoyfjS5-lkp@intel.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <202501170447.kNoyfjS5-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 1/16/25 15:24, kernel test robot wrote:
> Hi Sean,
> 
> FYI, the error/warning still remains.

Can we disable this warning for this code? It does not apply.

--Sean


