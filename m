Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C43225C804
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 Dec 2025 15:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767193603; cv=none; b=LpeDl2l5GxQTXUSiGwTNqEKSqp+YeYul8bo/5lxSSNmEYZymgtiLnhRq6DvXjHAOvqTd1u2NFumaTezLzgqa+1JuCpBKA3iLXSW7/mn9BECyJ8npsiTnrU1dCM5tqQ8Zwnag5fx6m9/gEtxBA15E1Lx+Zk2lDiCtskbgXLjtRbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767193603; c=relaxed/simple;
	bh=86U0yLQi2xwq1sRJzQYn7frp47uIpaV4dPugx+Ss3Pc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eTgDRJAhBSt0dNTWay/bkWEQF+5ibxWJHHG91L8RItSg6kKfAWKOzy0+4D54keXzZ5fIjHEXu8/KROzh5FExEHOQnlxkEW1FtYun93sier7HRhYYUo300ehtd2ZAGZdQaoe2bq4BhprnD0pMXpEW5aQhyBWrOIWyQD4shZDC5Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=AUtHcjIJ; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="AUtHcjIJ"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4dhCwG6FMbz9tly;
	Wed, 31 Dec 2025 16:06:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1767193598;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wzBtxQvYZ+NgQ6jN+ULUwvuLxxH/uU5VvXdCvUAspr0=;
	b=AUtHcjIJBWDQMFIyHVsY5n16FCS5S5PXZDUs+pON8EQb+ypPJd7xWZCCxOpc+tH7sTXYlj
	Ig0iZmJgL+9iZSPRFVEBSHICpzM4J/Q4azEVpzjhjN/Sya7j606ybU9UoSG8T4PlRZPy93
	J48cLzTu/5A6aPp28FgYa9AML1xKVII1bc5qfL8wX1sT2+dG7v51PJS7kxVA4tWKUoz7uX
	qA1TkWLz2xhoQVq0/HXL+zA1GXNhGk9esTpJHQvbZVcZNgX7AKBEBoD2qjuoU6uDcPWkI7
	MR2rqH9d/p0mpGSfvwQEv0OPId+IurkXyq955PRySvVNiv/qb3ZHe43ZqaUzNA==
Message-ID: <117d3f2f-dd53-4353-808d-a9f983e576a6@mailbox.org>
Date: Wed, 31 Dec 2025 16:04:53 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: include/linux/compiler_types.h:597:38: error: call to
 '__compiletime_assert_483' declared with attribute error: FIELD_PREP: value
 too large for the field
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
References: <202512222321.TeY4VbvK-lkp@intel.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <202512222321.TeY4VbvK-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: g85tpe9mef8y48d1b94mf7eohpuptmhd
X-MBO-RS-ID: bafb7bbedce6014170a

On 12/22/25 4:46 PM, kernel test robot wrote:
> Hi Marek,
> 
> FYI, the error/warning still remains.
I believe the following rework should address this:

https://lore.kernel.org/dri-devel/20251231145712.60816-1-marek.vasut+renesas@mailbox.org/
