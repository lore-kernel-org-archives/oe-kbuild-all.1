Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 802D01DC985
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Jul 2026 09:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784367072; cv=none; b=pF4sNwwWbuvRpFXbVwgjICxL0NrX7b6Osha3jQ22CIx2mm16YGpBoqgoq5Vg4DE+pqNkBJEOSE6tB7F0cZCqIKGhHWPpIO8bjUPtVv09XpLwrkzUG8ZfkVNq66EoSQlSZQLMgf1uQT2XyS1hPrtkhUeZtD63MDVtwNEiT2fibek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784367072; c=relaxed/simple;
	bh=4q5btQvEBdSsXusGFv+0rGuB0tlwROTK8t4UvZN6aqI=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=mIBz4zZUOdHAkDGhGcXIfscNngnM1LGmECG+GRM7fDvY5DLBUF2UF7g/6dbNtUjZvC6EdO4zyr586iUHJTE4Ey+QHfPkH290LfHOI+PRZxAcV2HnH+ykC+jHP0rqG486NOR4L9zv7RUN6p8DUVTzmqAGxubYaG0OWv7iG9jmrIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=wYjK0atK; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=OrDYz2Cq; arc=none smtp.client-ip=202.12.124.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="wYjK0atK";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="OrDYz2Cq"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 954CA1D00037;
	Sat, 18 Jul 2026 05:31:09 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Sat, 18 Jul 2026 05:31:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1784367069;
	 x=1784453469; bh=BmGJVTRnK0o1xognu95i7O8PDjEVISBb7XUxQLnNbZ0=; b=
	wYjK0atKYbVwnt7I1j0TgnDw9NtICw1+irJ0JoqPKR2vMX/u3agCJeu9kCY2/Cus
	2fqQUOlF3/DqZ+uBw1dMzNnyWRgmKE7SAkYN17GhWTDQ9MhQUwh/hvT+T+8AHUvH
	XivIdaPreKhXyIsqv/IBPsHSsQ7wn1qPpPEF/kjKXzRDoBz55Z0MldVCXi1hrFgj
	gCmUOgwWUidgxQOU+r0tPOgiOuEY8oIliWEuusYqQGHND8a0D6pqJyQaA1uApOFf
	lyGw2gQ0R5yX7r/xRdnGNNFSQXlL5uSkDPyEr4DR+WGGqD15Z5dsPmC0RysR9pMs
	wSc6okZ/djcNmI+1vLnOEw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1784367069; x=
	1784453469; bh=BmGJVTRnK0o1xognu95i7O8PDjEVISBb7XUxQLnNbZ0=; b=O
	rDYz2CqdcCbTNS6XdPkqidLrvry5Cm9JGYLPnZ55AjrR+Qi7ReEntVhWgzm5YtN5
	SVK2lEbfxEcxrwy0foIlm2enVKMhq9oU2V+97AAz1UnpYSrt+0+pTjqhzkbgQyT8
	KWUv7VtHGMMeV9RTo8+i1Da8qccByZBtutmDdJoCNkTGTsUHfamEWov5Mj+DW1KU
	YZx2Zb0NcVW51AcyS5mTLMzDCCqbUKpNhY1dmrN7pPGnTSsdfW/Y0npmJxQucSIK
	0DKZ9e5OhZlS1Ix0ZvY3uEfxvd8N9HKCOhE0/12oQAY4BZGj7YuCZWmWdvdz+wjY
	fILKStKbsI2BhCo26z6JA==
X-ME-Sender: <xms:3Edbaq7KR1YzNp15hbut_t3LVpqnD8rV6A7HO08N4ALrNxnL0QmOXQ>
    <xme:3EdbautzoNQf7bzaXFUQD40c0ExPnbUeq0TOvrPiZf6YvaYTm9hwYyVJtyqN_O-bG
    Kr6hebfgqKzizECY5gqqqxFAOEOPx04VgviyH6_qOv9jMehxaI9T20>
X-ME-Proxy-Cause: dmFkZTEl7RdWhluT2sAssQh2NC90EtUZz92+Kp+i5jQy1i6NB4Wc62n60xj7naOz6/HayF
    kLXr0ebHJyoZUMW4Vq+6FAR45cvaJbP4zDr8Qa5ygax/MxUALx2AeGgmxrzKQvfYKHL/MU
    /Fa7FqQfCo3q64OV97bLJz6//TfoLwi+TJqTnSSv4aM6nbc9upp7DXs1LC+5uad4xiJoB+
    j9TWGMhxJ/4vkkGDdjEpBUzQuHaQ4hOTcLGnBuLNDsdEpKZWqp4aAsk0wT9OOY2+zyZHOF
    vKMF2JChQoxx2zjS5THldiCRXdS3EBj03Mkaz8LjUoBzgmwjdXf0aSMBZ23IY3AhxgXsGW
    haqTn/9uKBl0dLSXIIeWeC3uM+/ryGxg0GvpXbBiT765QQGO7DV+W40Az5YuRDi1CtGywD
    0grTIOfGrU8qrPY0nyM/f4yTlsfNNpdlfL7aIMiGz6TO/nb78/Ar/lZBiLOuOArXJBiwtO
    9xE0UiNLLQDcDlK75nYlLqPo+TSHb+Eol3BjH9tvTtIIuZg9gfFchaX8WZBz3UJIU3tdjs
    /Vuo94ZetqNzTtIAtRKU+3XhBY8CuoKTB+bRbp3kMcyic9CmNWUsn39lElHc3limZWRXUh
    JpTkaUZ9xSx6Bqh9p/ZECXlFwfdPfUBSaMLCPFBvWnxUPLwsxhFphPD078MQ
X-ME-Proxy: <xmx:3EdbagFI7IVzV7WmdbRBMV6FeWoi7xw3qnMWgnhPnB28A2h_EAbH8w>
    <xmx:3EdbaiToM5HgfcYunyZXS3uRRiC-w_siZzrgA7O-FFsE6xcYy8v3zQ>
    <xmx:3Edbalt3EwWbyf87xeoFNi0kJo8hBqwBbW6NmzXxeeFNr8fc2aJRiA>
    <xmx:3EdbaiLV2o9g-xWaR0xTBzB6WE-NIYyQPDb8r1yStz6uNdjM5vUZTg>
    <xmx:3UdbapQxxgO-YPE4BABv1cDoHiZTvzcX5HGBqnHKQQlKE5IjrMLPRDWC>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id D085D182007E; Sat, 18 Jul 2026 05:31:08 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: AJTyniAy0Y33
Date: Sat, 18 Jul 2026 11:30:48 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "kernel test robot" <lkp@intel.com>, "Peter Chen" <peter.chen@cixtech.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 "Pawel Laszczak" <pawell@cadence.com>
Message-Id: <7d51cfb9-0d7a-455f-9bb2-0211b6e9c090@app.fastmail.com>
In-Reply-To: <202607181505.CVpdSKHV-lkp@intel.com>
References: <202607181505.CVpdSKHV-lkp@intel.com>
Subject: Re: drivers/usb/cdns3/cdnsp-gadget.c:168:9: sparse: sparse: cast from
 restricted __le32
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, Jul 18, 2026, at 09:49, kernel test robot wrote:
> sparse warnings: (new ones prefixed by >>)
>    drivers/usb/cdns3/cdnsp-gadget.c:166:16: sparse: sparse: cast to 
> restricted __le32
>    drivers/usb/cdns3/cdnsp-gadget.c:166:16: sparse: sparse: cast to 
> restricted __le32
>    drivers/usb/cdns3/cdnsp-gadget.c:166:16: sparse: sparse: cast to 
> restricted __le32

This is clearly a bug in the driver, introduced in commit
241e2ce88e5a ("usb: cdnsp: Fix issue with resuming from L1"):

> 241e2ce88e5a49 Pawel Laszczak 2025-04-18  165  
> 241e2ce88e5a49 Pawel Laszczak 2025-04-18 @166  	val  = 
> le32_to_cpu(readl(reg));
> 241e2ce88e5a49 Pawel Laszczak 2025-04-18  167  	val = 
> CHICKEN_APB_TIMEOUT_SET(val, cdns->override_apb_timeout);

This is broken on big-endian machines, because readl() contains
an implicit byteswap, and the extra le32_to_cpu() swaps the
value back.

Pawel, can you fix this and address any additional sparse warnings
you see in this file?

      Arnd
