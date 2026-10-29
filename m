Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793300064;
	b=BdmW+ZjtWBZHig+sx3/4TWcaDE9cC4mE4K2+4nfRrLVmTtXVvesgk/cPOf00stoKptS/
	 YzYHnwt7zYUeRWlxZuGU7xRolQx8vKt4logFMirUXsALZyQXjhbX02wQ0N8zhjUJhwCmg
	 21qYWKaSbQ8Uzgsws4CW2U0MAnhkJqWa+s8zLbv1LPBTyXW/lu9Z+bjN0zozxF/nDFZw/
	 NYRO01wj/oQjsql1fAg8vRNAm4Cd12/E1F+B6WGoLthpKXLuZD77YXjd1Chpj7naXXVbt
	 64HBw5XzhXiJv01Nz+sUA5ZLuOA3wmipbzs50QP6vIKWh05FvGpqsFJ593g2wbTTUFg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793300064;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=mGLPcOV07vFxEsBt6sKpXx7XuO4u8sK9yJr1CxMA8Vw=;
	b=glibaPClsI9QXsa5epg4g4qXuOIggPxn2z3l/2kCKRYIK4JtVBOh1UhOPmYDgLmGPmU/
	 ntZgrykUWZ6GrhtqQqd0Q7pNllI7yFv25Myv3vrL+h7lXeyemGKlnDeEKq8czSV0l9/Aj
	 A7WcVpchlGRnDTP9tA67sff50FPN5imDSK/d4Xl0Ha3JnhuOI4Om88jb2jFgQSM+nWuH8
	 kZSihVj8sXf1uIn6umVF1kcz2UkcxRRg1nZfgA2+PgmH1DpzEhSqNdKCsDS3WAdHl0S6n
	 +F6af/3c/U1pPNt/sP4K5p+jojhSEnbcCL2x6KI/Ug5V7zN/LkuoFdYDeVEG783ONUw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SFtCAtf0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9BCD606A31D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Oct 2026 18:54:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9BCD606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SFtCAtf0
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b1afcd2d23so3919401a12.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Oct 2026 11:54:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793300062; cv=none;
        d=google.com; s=arc-20260327;
        b=Ygvfh5PoLuOVLZubzPhW+GVvYR+mfOTENqFXomRZ7swwcBrg4ZSGXSCyIYSNd6QudB
         wTcoZlt+34JmqVzFzso/xNdoJoWFPp5HrKy/2Dom0yhcEt2XYeMGsp6p02kgbjqjbNmC
         XxZgPmCI6YTimTRvsLQGzwVoeNXJqDJ3cJ00WIB+F4tY0GgZ19S2UzJkk8TXMNBI5k0v
         TXWgsDIweNY6juqxXyFWU6E6fEzVziOZVoomJ2fJSBt6edJMjns36lSMtDYoJSbv03bE
         RhShVO4z+BKZdO4xTPMIa1I9da38cuv7+zioZTfaM0L8U6oswBIW3+JTxBb5XDOynDDL
         ffdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=mGLPcOV07vFxEsBt6sKpXx7XuO4u8sK9yJr1CxMA8Vw=;
        fh=4e5fQFkxDVKEIaF0zFKjdJSiKQmV2cCqfEvwWXgVwhQ=;
        b=QaBPhiX/p+j90Wx9fBB5iSs8odFjLg4CL/Pxl6sYOj/o+ZRuEmc7uJb/OVTbz7F4KR
         sTJnoPfqosYBIguvrQEIpCdZsDOYVSlkgT7PgpVuexJjmHEUqfLaJBfopfKdlu5Gew6p
         mgncrryifOKlyhPxkRcRFuY7ieUE2kwV2lazbYmvKshmOsP4nUcev0RHjk5vtW6+fzXz
         4fcdZNh0HoDIwxyC7sUQho9QYJBcroJYCIp/uKKJm3SsSWkpLwJilVVS+RQ80XaY7+Nk
         x6JSa2eSusenGKLEFF/0XBqMfviG4mHht2Hsj4fYZt8GMMNhtWAc+/pftdcwUzqubFzr
         B8Cg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793300062; x=1793904862; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mGLPcOV07vFxEsBt6sKpXx7XuO4u8sK9yJr1CxMA8Vw=;
        b=SFtCAtf0NKVAfK48Z+X1+8Dmzu8QNM+IcTFU2pYyPr7ponI2yHxLo0J3/EM8RSPOz/
         XmAL8k1miSlA+DHEawoiCQq8OTToiHGBCQMy55T9qeSOj4g4tL6jG5MxOd7lpNeuh6ZG
         MQk2WtdodscJCLhZamvUSzs1ys8qtWRVbEPYSRly5eEalW29SAPuRpbnuPfi833JxNhO
         Oz6LSfOrv1xdeCC+OSjl+IuCPMtN+SodmbJqPITYhG+SDpnz8R967uj/3SoUCsvoF/JI
         G4892Xtby/Wgf6+roAG1FgO5dtzO91Lx9RttXdZXJlGIvVaVpTjh89HzMvNG+nHswsZQ
         bXQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793300062; x=1793904862;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mGLPcOV07vFxEsBt6sKpXx7XuO4u8sK9yJr1CxMA8Vw=;
        b=L4Td0A6Hpp/b1U6nC4hnzqQy6+47gZ/ezvZAP1SI/geI4PKp293AXIPvDTplNLW6Ki
         GtVzMWcC0qX851vmjm/q7OGx7E+6FT39uv75krt5ZjteQa5iwo7pNBOjwtCNFQrpe/wK
         BacYyevInDVH3RSjTl4tLZxcP4oQiIX6tchU7RUsgTqLGNXuYjByTy+KZoLOnHfrBrnk
         PTm/N7S5IA+A6w/aXFnXMYnh2CB5j7sea7VH5174XdTWs1ZJljrmSEwWmLFhf0WMoeKy
         5NcJEl9/VuQDbREJUByy+DHzKwEszYFrkbiIujs2redfzpZFI+xrG5gJVNkeYfjWZSgZ
         NP4g==
X-Forwarded-Encrypted: i=1; AKwUvBw8yZAMFGEaG3/NoOp+7kgNyP1dr+zWz74vieL6qXoe2BhsCuWx/PFRnTzL9XpD/Ck/PTHS82isHae9G+mw@lists.linux.dev
X-Gm-Message-State: AFq9FYK+rpk8SUXscQ/9mgEU9xiXoorNgBGTVLqe1ZwJK76S8kJQl2hq
	03Tih5r2WzulMYWPbOAZntGhr1qQbB6XsYNnFsHhsMvdpXkDbsXdjfhKLHfkplADm6lAD15G5n2
	pCM79LGLv4z2QUNYhus3jI/Q4LNoU5AI=
X-Gm-Gg: AYBFou3yMZyE0/x6ea1vhtYlJ4mCcHHUt9DI0/FmnepoWSm7G/eOHaD/fShEJYYTzv8
	Re4/v4mtZRVwqviGaJToVFGzW88l8ubyXB2dN8qm8N/TBY/2cEceUt1qbFim62X4IidmvUaV+P4
	k3Mc0Bt7W2KdnsCfu4HRvLnRubc1uESEfVwl52SpX/pxh4KKXtlSOG7+Rh887WurY+L4n7Dzhww
	ivhOGMqiMm2yvEr2W8zeg4nGsYLmW/pOK52eBt8KKen40rl3AVxhM3DKY3Xugwx+r3OF28l7Qis
	Ryqp5URPbwCT29vQ6UfxDpt1NWGbzLtBuOQyimubhEyd5dMTx3BLnYekClK0cTq7HoXNPoGq6Yh
	vnYcenEYdsOMAAjCrc3gzsmqtSGA6rjDty/0=
X-Received: by 2002:a05:6402:a6c1:10b0:6ac:a862:d8ce with SMTP id
 4fb4d7f45d1cf-6b49cbd6ba0mr3412953a12.7.1793300062077; Thu, 29 Oct 2026
 11:54:22 -0700 (PDT)
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <202610290223.iOEGeDs2-lkp@intel.com> <20261028202400.GA835963@ax162>
In-Reply-To: <20261028202400.GA835963@ax162>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Thu, 29 Oct 2026 19:54:10 +0100
X-Gm-Features: AclHuK-nQVrYwHXIPfeZqhaOMYDdttYG7QvDfwRoqznKlouAeTSr_3BHeahpDrs
Message-ID: <CAORyz2KEJ5M86-+z2zWXVTJwbNO8SY4DWjn5Y6EO_-nPhdiytw@mail.gmail.com>
Subject: Re: vmlinux.o: warning: objtool: mtk_timer_probe+0x23: no-cfi
 indirect call!
To: Nathan Chancellor <nathan@kernel.org>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>, kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Thank you Nathan for the analysis and suggested fix. I agree your
patch would be useful even if the warning wasn't there, to make the
device probe more robust.

Being a new contributor I'm not quite sure what the process is now -
should I send out a patch with the correction, just as I did for the
initial contribution? Or is it going to be fixed by the maintainers
autonomously? (Obviously adding a Suggested-by tag with the rest of
the bots' tags).

Thank you for your help
-- 
Luca
