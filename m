Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792747906;
	b=n+7t3TA4kst0nF9MkvYNfXGYFargmS75HxvB0stKqvZVSmGdJSHINENDiidOxtTs9giK
	 03SZKEZYSgD7N3UhK7XRqYI9DV0xZqX1Z+vJfFW4PZhP2sQ1k4HZ+6whLwIdnSJYdxXdN
	 +GjmMKYqOQEaIAPLT9rDdDxhPu/32H6BSnGF1/R7PYpqNW4QfS1O30wTgWax7Z7tdlay9
	 vNNGOBSsQXF9Yb1ytlY2EBb0ien0XVSAaYsXPkKd07N2LhoHgnMDscfJOsMOrJHTmImrw
	 +YAguKQRZIPa/mNlK+xY7D5wrUT5msBIvsCaTDgkFN0KGBjAMeTdTEdi3XOkrt/XAPQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792747906;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:Content-Type:Content-Transfer-Encoding:From:Mime-Version:
	 Subject:Date:Message-Id:References:Cc:In-Reply-To:To:X-Mailer;
	bh=4/JtPZxwY0peCYqrhbe/GP2Ebv+7Kymqi3t9iz/6G8w=;
	b=QygDAmMsy1jlJKmZhaq5/uRk4Dkpj82YVoVpwRCr38m9HCtlT1aFd1XE4nrb3f8+G117
	 Ogoo9Jerukkipst9xLd3YpfRj9ZRBZZruXrbrW+dbvEeNfKYzvDrJyXS9yX59nlGBuaS0
	 aL6oiN73iB6MwPdjiQWUDUULcIhUBEuZ8Q81gmu+jq9/xlEttzlRjyZ3y4uAVEyZo91GW
	 kKNOx0hJYN2h4ni1aHJzctZmLd+MvwPI/x7vQdB3KGnWMzBSOgqJtznw9s/VJ/EgYAvOX
	 IUkyeMF2i0N8MA3R1rvybl9WcJYBfq/Sal5v98Vomrjiuzz4gCvt67NpFQm5pakVOrw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=xenosoft.de;
	spf=none smtp.mailfrom=xenosoft.de;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=AgZuoWkd;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=eoDTpKVd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.170
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [81.169.146.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1CA3606A31E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Oct 2026 09:31:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1CA3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=xenosoft.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=AgZuoWkd;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=eoDTpKVd
ARC-Seal: i=1; a=rsa-sha256; t=1792747868; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=fXeXrPJYKiuSw1hm3b30uNLko62Rs3Mow6QbRxTkmfsfe6jSGCiNv7UmxeMSe7y+MJ
    mHgyJQPuYNdSdw9WsV7W9NTIbsOBe5No9JN4DwtTdW95yKAorhP/+vGq6K1/dCEEgR/j
    ccxG8R9DPnmCb1J+YY+Iye4Aa1xjFumBlA5jQ6wAsdviLNUD+Q17WG9LORodvnUxQ1V1
    sS1fPSTPfn14lMQjRK/FL//Q2CCazlqD2JsF3SkxsuNKELdsKvcsOxJ0kJvqLrDFFiaD
    qNFbHFOqfApyWs1GmYKSSAM20OE4/kX7PqpLkHxSA56PM4EAWnweRYgvA7qHs/+JTf5N
    86TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1792747868;
    s=strato-dkim-0002; d=strato.com;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=4/JtPZxwY0peCYqrhbe/GP2Ebv+7Kymqi3t9iz/6G8w=;
    b=QffDn1YTEbNg7SnRJku8p4HCoxduZnyv71ThNMYvkAfRwUGMPBLFR80xB3X/b9KQNf
    JEULUlbkoqzkbekCStiDkl6LMGZS/fYcNLN1QkFa02mOWKw3zubb4xVKXnkSbvEUfucA
    RugXGVBf9PHBapRNKsxbICTiHLi9y1ZZrYFlxb0QoSRKu3qBGi/9Iw+xDEIh5ROc2wql
    d5+/xFwWOQp8gKWPRPITt1wjsFnNPYgbEfPKqWovsHduY7m35nXSV+pZ4HGGxPsmirpz
    eLDcfVnHuf6Xj9drUbWOyAvv1B6W5CO4PaUtZdAX9K0ZOAtQ0cxDS3O9WE2W41VhdAP1
    E/3w==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1792747868;
    s=strato-dkim-0002; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=4/JtPZxwY0peCYqrhbe/GP2Ebv+7Kymqi3t9iz/6G8w=;
    b=AgZuoWkd6mfiyPn8N80BIxTtkPKYKBSV27z6Z28aqM5QOEkKNa2hbvfJVd73Jb5iOQ
    +htQhToZvhhsMWtCo+eqa8Bf7i3/vamiT70bTAuBqwq85fIMBcGZJh4KMYGiMVhwrsYy
    eBrrJ+l2FA9YI59Ne2/rq4vxH8S4p1nuvSwxVo5wrOqwAoZn5ZVHdX3BTekojF8+wCfH
    8/VInynblFdmVzcmDc6IAv8BQbQZDwfsYHZPofoaucumRpOTETNwfNkmshOjaB+/HVae
    9E138FoLKyTXYn6yRmYA8W4KkpRn+TCsyiaUpu1zKRWLtxqdBESe86QHnAg0fyaH0iXX
    RE/Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1792747868;
    s=strato-dkim-0003; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=4/JtPZxwY0peCYqrhbe/GP2Ebv+7Kymqi3t9iz/6G8w=;
    b=eoDTpKVdXHDOQZS8bgHTc5i+sb4pLXyPvJhWOKtjimL5hcPwO+miCSQxPVNv9qeAsQ
    yu4AO8GX98LlOw1b3+Dg==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7V7X5q1sy7MWioscGEbW2z9QYPf5P1ugQGy1cNYzA=="
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id e825d929N9V8ZO3
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Fri, 23 Oct 2026 11:31:08 +0200 (CEST)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
From: Christian Zigotzky <chzigotzky@xenosoft.de>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] Connecting the SB600's i8259 controller rather in pasemi's pci.c than in pasemi's setup.c.
Date: Fri, 23 Oct 2026 11:30:57 +0200
Message-Id: <7C0659AC-D012-4E98-BC4C-C3BC2ABF6A4F@xenosoft.de>
References: <ce442cc1-5820-40fa-beab-e9c0d6a0df3b@kernel.org>
Cc: Philip Li <philip.li@intel.com>, kernel test robot <lkp@intel.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <chleroy@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
 "R.T.Dickinson" <rtd2@xtra.co.nz>,
 Darren Stevens <darren@stevens-zone.net>,
 Damien Stewart <hypexed@yahoo.com.au>,
 Christian Zigotzky <info@xenosoft.de>
In-Reply-To: <ce442cc1-5820-40fa-beab-e9c0d6a0df3b@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: iPhone Mail (24A446)

On 23 October 2026 at 11:12 am Krzysztof Kozlowski <krzk@kernel.org> wrote:

You are referring to some other patch but replied about this one.

Best regards,
Krzysztof

- - -

Is the following patch OK or not?

https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20260801043458.12500=
-1-chzigotzky@xenosoft.de/

Sorry to bother you.=

