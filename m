Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795760103;
	b=DCh7tzsvYgEcz5eT9QSsPQKEB6nkTzr+skj55RqFjO9Nj4pUZV1HuhKpL+lev2z8Qixz
	 5VO6kAwUI3annIVGlei63xOMHwX3mnW3pePOSAVbecT3iRFZjn7rDcofoIJMQQhat4lq+
	 z90JEZOKeMgdQBjYX774qt0dns9/08mA9psQgBAm0hLRKuMuwalaihpY64QcVLVMO8dKI
	 1VIWJPXdg0TtHLSd6tJnz+kybGNSPtFVn8MbEIgRl0aYnmXLrg/jGmiEf9RR8DemAfz3X
	 5PqcQhsgAYMRtmOFVO/c5KydLtNrV3aluvPuejTEZ3rw2VDJlOSUn5B1ITr2h3RvJGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795760103;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=5VeSFAKw842mvl8PUGM5OyRSDHWV2W9U3+XW9s+w0GE=;
	b=pzeAa5UFb6Q5P+AWTeuqnKucrqk0dNffLlfOsX5JcZXCMV5hBHHEf7NnOVKhoNwOcv4H
	 yaTGINSg5m4SjyCS8I8klKGBZg+v5sEscYTy46ng2cuElWnRBFbA/OnioRqxAEu1IhL7a
	 soTbUPs/V9hYbKuibkW9t8C3ogvXSCSKlIc41wNclNxceZ90cds3BrcKEu/Z19UHndXYd
	 F+GajrKdSZNS5ZFyg0xsncY30q5/PBgI7QDb6unsqknvnfYxqyVcLDP71ysW+NKOK5WJZ
	 Jtd8C2RntU6OnWCVG8Jqvc8PaRo/Ep3wyVDStenzy/EDhOpTvF2xR5MGMC+U2m5HFFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pereq.eu;
	spf=pass smtp.mailfrom=cryspen.com;
	dkim=pass header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=g73JgnZU;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CFA4606A31E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Nov 2026 06:15:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CFA4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pereq.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cryspen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=g73JgnZU
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bba5e17cbeso23571525e9.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Nov 2026 22:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pereq.eu; s=google; t=1795760101; x=1796364901; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5VeSFAKw842mvl8PUGM5OyRSDHWV2W9U3+XW9s+w0GE=;
        b=g73JgnZULRI+EFn1x/b7AhgSv6Mk4iOnufKBO0xK4kvh+55aFK9IX8BaEwennnE81j
         UX6hTLZjfMQhseniYrlOjD1hXvTU/PiyCrltLB9PdFlfxnfZed3cKqnqke8HsNpmgFCs
         1zMOCOv38ABRxC6LUbQidbiGlPu9Nu94nNq02S7rIIoewKOtcwZSj7tA7li3opKLdIx6
         5wjE9T9GxUmtPuQ9CJtKAgCe1ly7Sx1fwgWNn7oyOWRTrw3ixmLkMy4/MnsFRtZzMqYt
         HITVfR84mONJ0VLsHxXA4ZmfS7G9+ajZ+dDoLx6WOY6vdREkC7gWA1/3tgeNHfZj1mv+
         4K3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795760101; x=1796364901;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5VeSFAKw842mvl8PUGM5OyRSDHWV2W9U3+XW9s+w0GE=;
        b=jk6D/B94INJCkCaeAbTYeEikgq8wm0Di978omgfc3tSVuZGHSdEOdOtg7vEyEglxpT
         JpA8fbgypb4gHfztPtquWgeyPE0cIteMjGlvmb3lfI+Rc1i4gcsCGLGNwtaaV2Z6GeEo
         RoER34Ysvpj2ZFb4xuUcXnLUKJrgYNM+MJein9rnZXeRWPPHiHeEZpmKeev5JZyCbO1X
         zSzm0OR5DAgu3o+SKypvlWX0opx+nHKM97ct9BzpmGPiv7e+JHcPogkJy6yO3uh+kNUj
         eEXprdCIZb17Aq2gjaEaHttjVGvwib12J/4VqW52W4KErPuDXqzhOFLpCq8qUfTD5zwQ
         1axQ==
X-Forwarded-Encrypted: i=1; AL+hErHZ6HiBsXMQlL+VhSu9dyIkKt4rGLqgFCvpiLG69rkUf1jPMA0zANM/vFMWSU7iDpWNjaZ6bvTMPXOVce0N@lists.linux.dev
X-Gm-Message-State: APuU4Z9fTGLFsXC7ZM1+1kgdlcLPTCVMrg6vacqGgsjdpcHsfU/bSd4R
	Io997a+XChp5yrVwCNcSiQxIrgbCPdNPlvYCPMKZazpQl9s+yZOBdYmQUHRLfRBAOgg=
X-Gm-Gg: AZFdTZeRkSEo1v88xP5Ck4vw5n991kjn/Rw/sE1WRS2te4o3LQzJoq1k34xdztzD10K
	zeGLcDoUMVre3re9M+HVZ8GS3qDcHLM9ZcpBEImWyYqTQnK3oqIbgHk0LwPci2WG+Y5V6O7cn0V
	tqMSaZXCkqje2+JgWPA441LSHu44g2dBZhOhyCWGYQmi/8CgNBJEUNpNNz9he75rtoOu0TCB8JX
	QVMX1EggX8nA7qdUHZCif8P/NrPjP0HhyFDCW4/m45w3orSxY9VRnDddsCVXO18NcAxeJykagOV
	lJ/ZxLfBirfm/j8yv9O8YzMCkaDDPUG90w/61LUQoBf9xr9MQ4Pardc3ihsWBRSuwKO76GuHI1I
	Cq49x1oK9awQErzS/YTGa//JAWMcEroOtm4Vn8+Lb7LHS9MM0llLewR9HimtaIvEYY8IqlH+WiL
	cbfQxP+zKRWsj+cXTev9CpoQvyBHsM8N5eC7S9Nnal0x8INVlRHqXZU/U7M0G8Ac61h8r2lN9CV
	J8m32qLi1snQmtTGFTSQjwjbC0bvIMO17C+WzfGIsEsXNahZmjA4cO9vrj1IaK2cnIa7U5pQHGo
	OGHuA0zEyAWhzkwdDDE=
X-Received: by 2002:a05:600c:64c7:b0:4bb:68b9:f610 with SMTP id 5b1f17b1804b1-4bb887ffee2mr448194565e9.9.1795760100638;
        Thu, 26 Nov 2026 22:15:00 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853b2437sm922527445e9.13.2026.11.26.22.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 22:15:00 -0800 (PST)
Date: Fri, 27 Nov 2026 09:14:56 +0300
From: Dan Carpenter <dan@pereq.eu>
To: Yaohan Li <shunsheng1218@gmail.com>
Cc: Dan Carpenter <error27@gmail.com>, Mark Brown <broonie@kernel.org>,
	oe-kbuild@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	lkp@intel.com
Subject: Re: [broonie-regulator:for-7.5 6/6]
 drivers/regulator/qcom-labibb-regulator.c:444 qcom_labibb_setup_ocp_irq()
 warn: 'vreg->ocp_irq' from request_threaded_irq() not released on lines:
 444.
Message-ID: <awkf4CNhSPz-lcEk@stanley.mountain>
References: <20261125184601.R647t8Sj-lkp@intel.com>
 <179567739729.2548149.711673218230357357@gmail.com>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179567739729.2548149.711673218230357357@gmail.com>

When I send these emails, the only context I have is what's in the
email itself.  But I have now downloaded the git tree.  The init
process is a mess if "->done_this = true" flags.  That's a nightmare.

The better way is spelled out in my blog:
https://staticthinking.wordpress.com/2022/04/28/free-the-last-thing-style/

In this way every function either succeeds or cleans up.  We only
have to keep track of the last thing we have allocated so we don't
need ->done_this flags to keep track of it all.  There is only just
the last thing to keep track of.

Looking at qcom_labibb_ocp_hw_enable() now, can those regmap_update_bits()
calls even fail?  It's not clear if we're undoing the "Clear irq latch
status" or the "Enable OCP HW interrupt"...  If we did the clean up inside
the qcom_labibb_ocp_hw_enable() instead of the caller, that would make
it more clear.

There are two callers so this weird error handling is probably done
deliberately,  that makes it even less clear what is failing and what
we are trying to do.  I would prefer to have a normal function the cleaned
up after itself and a weird-o qcom_labibb_ocp_hw_enable_no_cleanup()
function that had comments explaining why we left it in an inconsistent
state.

I asked Claude to review it without any context.  Here is the prompt:
"Review qcom_labibb_set_ocp() from drivers/regulator/qcom-labibb-regulator.c
to ensure that error handing and cleanup is correct.  The error handling
ideally should undo all the things that were done so we can fix whatever
caused the breakage and retry.  Ensure that we don't leave the driver in
an usable state."

I haven't looked at Claude's response carefully but it complained about
the same code said that there were simpler ways to write this:

  @@ static int qcom_labibb_setup_ocp_irq(struct labibb_regulator *vreg)
          ret = qcom_labibb_ocp_hw_enable(vreg->rdev);
  -       if (ret)
  -               qcom_labibb_ocp_hw_disable(vreg->rdev);
  +       if (ret) {
  +               if (!vreg->ocp_hw_enabled)
  +                       qcom_labibb_ocp_hw_disable(vreg->rdev);
  +               return ret;
  +       }
  +       vreg->ocp_hw_enabled = true;
 
  -       return ret;
  +       return 0;
   }

  A simpler alternative: return early from qcom_labibb_setup_ocp_irq()
  when ocp_irq_done is already true and the source is known to be on.
  Re-applying the constraints then never touches a working setup.

regards,
dan carpenter
