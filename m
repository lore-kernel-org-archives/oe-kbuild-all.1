Received: from out-184.mta1.migadu.com (out-184.mta1.migadu.com [95.215.58.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DECF5C8E4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Jan 2024 11:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706010412; cv=none; b=GuF1yHYzCqiWieeW/afSpBdLp89IvElAUWJPiYOclG1v9vNaJ/e5GPjJpDWJ93dA4h/HiT+Nk73FjPKPSoGmdME6N7CXitLWn93etEv5wshARqY+igX8VglCRcYLyCXxLAxglGxQv4ySgpZH+PuL8zlPPZB7dduPUcbkBvGsTTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706010412; c=relaxed/simple;
	bh=8iNYNzEMbXX7eH867vEjEN6jWmpHqLfs5hth9+WNIjA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cP2tfEZ9NoaWaVU3sAAKbr7phM78Y5bKc9MuKl/qZuDzFPkjnTHE7XQ4X1qwnEb3+VoCR4hVlKpaHQh+KWwlP0KgvI0WCcxukeGQjqpZ3MWm/qQqoY/izriB8y9PoKGcQZ4eUIgWqlKgajKQN8mGvxF7ahBJo08hh9LNx5wE2rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ujUBXYAk; arc=none smtp.client-ip=95.215.58.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ujUBXYAk"
Message-ID: <0dc8a682-1d6d-435e-9633-98c9d5cc9520@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1706010407;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8iNYNzEMbXX7eH867vEjEN6jWmpHqLfs5hth9+WNIjA=;
	b=ujUBXYAkEQQWkzcnisTyl0YIx1jC+baclWANZoDdANpHjJhgsWBmbmsToyjtz8LH4zbX/L
	mSbjqTblSior+bsjrcAdM66ypgBol4+fRvGDwssKyA0dB0TYApz8fYyRPlBZ0o7POf57vF
	ArtmneLagj8pzHbB0VAnkjCXN3I90KQ=
Date: Tue, 23 Jan 2024 19:46:42 +0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [linux-next:master 139/1036]
 drivers/gpu/drm/etnaviv/etnaviv_drv.c:614:3-14: ERROR: probable double put.
 (fwd)
Content-Language: en-US
To: Lucas Stach <l.stach@pengutronix.de>, Julia Lawall <julia.lawall@inria.fr>
Cc: Linux Memory Management List <linux-mm@kvack.org>,
 oe-kbuild-all@lists.linux.dev
References: <94afe420-f3b-5620-2380-82c9c62838f0@inria.fr>
 <8f844ac1-eecf-4ace-854e-6d7d7aad9ad6@linux.dev>
 <387720feac4593ac66fac594950975a6a317da46.camel@pengutronix.de>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <387720feac4593ac66fac594950975a6a317da46.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

Hi,


On 2024/1/23 17:25, Lucas Stach wrote:
> Hi Jingfeng, hi Julia,
>
> Am Montag, dem 22.01.2024 um 21:49 +0800 schrieb Sui JIngfeng:
>> Hi,
>>
>>
>> On 2024/1/22 20:33, Julia Lawall wrote:
>>> The of_node_put on line 614 does not look useful.
>> Simply delete that line would solve this problem, what do you think?
>>
> Yes, that looks right. As the patch was only in etnaviv/next, which is
> not a stable branch I amended the patch, dropping this line.


OK,

Because the for_each_compatible_node() will call of_node_put() for us in the loop,
Since you have deleted this line, the warning problem get solved. Thanks a lot. :-)


> Regards,
> Lucas
>
