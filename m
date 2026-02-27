Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9AE734BA2E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Feb 2026 16:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772210965; cv=none; b=JvCtndZa0Q4GAZz9N79VIHDGgsmu0BHfsE6boUYK9AhDMy53avAW+Cq5KUiwMd3YsDXHi6zaoqACmJ6TcRtTqux7qoZBdlIKQVgQKvSxQHwjBvSUIACJEx0NC83Gm3NL06p2a3vjPJskTBXHvCZ3M5B4Qas/MVZJIOkh4EbHAP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772210965; c=relaxed/simple;
	bh=nB8ACLDa/maVuyIonK23zA1TMYBPWmnsl35nExKZrIE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P7vOjUZ52acL8/jZjn+Mg0hgWoEP85QGCyyOiFpIBED4jCb6wsBW0q6iuso2XfmpTg6eVbLidFDsh79zHugDWddjWqo317cV+npEvHu2G1KwkMOdoippKlxRhwUeoeS4YCneT27T3yY/dpt62tU1HIU69l2uZItHxmN6+OZ0p0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XTqs5B9X; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XTqs5B9X"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43987b97701so1764306f8f.3
        for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Feb 2026 08:49:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772210962; x=1772815762; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A/LFLpePUhhqI6yxDTeIBKOmLDg2carPPgsWLX2flrE=;
        b=XTqs5B9XxSwnK7ycBxs9oMB1FJVCxm0jYl3iPBHmSUo1XZp/yH4mvtWQL6NIgujw3A
         DCGHjt5nMRE8kyn4x917EWtzUfLxkhHndnLfZvSobZsmsrb+Hu0dLW9hxrIhMNosoIU6
         uPanuBbdp+h/rONzivmpswcvNwDQwbP3KKgQ244cD9xbeOSFkp9idVenI+UTkKK1c5XN
         vfPLwxRNNNMqU4Vj5aRCbZuOSAzQtrCFl9JNTP3Rw7Y4ddSBzOfAJ71Yow18SdRzDOTS
         L3GpBxU5Z+fFAGOlULY0tkPgW0G9HyBiHOiVYEjrF9SbhpOwYjkO9DJVydgOfFHji8Sk
         tIBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772210962; x=1772815762;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A/LFLpePUhhqI6yxDTeIBKOmLDg2carPPgsWLX2flrE=;
        b=pdvGERpviVCTe+Prr7iQ64urbQtFyccD0nxUOfVOWqhnmevckKjn0trW4sSG6UP1Bj
         xZ7FDbS9AEqifaPXbWSGUUHBKcyUYZuERzQpEYPDG9W+uUX+NYzHmecEV2xkxSWQso+e
         3Pfi3Cz7kL70x1fxfKD8dlmlwLwGCDpICiQ/NEya9mkR9GEYRPzb5oYmj9TaL4Weo3uW
         6bbui4kh/SpDYAuQOr8Gi8um7kO1REuysRym3b4GMBaUHZqzewdu752ttYwBg1tGv1p8
         VWKtFo+sEqRddczmD1dN4Dm7ydij5IQPA331jhMr0BuYGqOyCkqybArtJXuih9XjIiTj
         hk3A==
X-Forwarded-Encrypted: i=1; AJvYcCVJKpjMN2ydTbZZ/Bi8qKg2PrmM7cMQGWx58Z5VIf2+7qdDFqRgdEuS0GgVm1Bgwbn0gHWWhfzsKx0K4hg/@lists.linux.dev
X-Gm-Message-State: AOJu0Yxf9Xj03e+K4awCl8mbReUgUnMZovox1dM10y22yxM0d08rgLIG
	qz7mIbsIuBcsNuf5oWSUaVbirHjzl4MYHO3dvuBDwG+LW7RrxGblJNHmAjHUVJqZyp0=
X-Gm-Gg: ATEYQzwxp1cfHRHbAjg95zbUxNXmJOI3Q6gJptfhUjhm00gY8mmO1Kr7WeyGtt5jXRU
	4Fenx5+QtGk+v9mHS8iUaIZiYd6DUjSDjm5B7WYLd0T30AT7uwf8qR8ETD8keFaruiW0x2H1Hj1
	AA4XrhLCn1LIMl+ZM87WF5I3mTdJ+k4U843lFGS9T85yj4NdpS05SSbTeSnQWydOFyjnNEI+Nyy
	Llfnb+6pNQjdTg6Y1wswL2unRk+mI4a1wf72Xd8Tu+YYit8xhOcfj+MlERSKE1LnZLI623IIrkQ
	S87wz3VdxSxtuSOBOtQFNncq1kiLc0grzUWO1/0IFxZiuSN8EsQxI3KlaHVOr1Hz0XszcY1v/Va
	uM7Wpb8m0e/dxsys27xRySSApDYTwYiml8CBDMz53Zq9Vz4hLiAb9XlBV7b/CHIYfXKlCjhkkJj
	X0UK/zxk9fh797y1z1EWyFgmKXU4vJ
X-Received: by 2002:a05:6000:1a8b:b0:436:34e8:e661 with SMTP id ffacd0b85a97d-4399de279aemr5867410f8f.31.1772210962058;
        Fri, 27 Feb 2026 08:49:22 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c60f8e5sm8838998f8f.4.2026.02.27.08.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 08:49:21 -0800 (PST)
Date: Fri, 27 Feb 2026 19:49:18 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>,
	Patrick Rudolph <patrick.rudolph@9elements.com>
Subject: Re: [linusw-pinctrl:devel 16/22]
 drivers/pinctrl/pinctrl-cy8c95x0.c:1325 cy8c95x0_irq_setup() warn: passing
 positive error code '1' to 'dev_err_probe'
Message-ID: <aaHLDnSHe--dR_63@stanley.mountain>
References: <202602271847.vVWkqLBD-lkp@intel.com>
 <aaGzzsLMeW2DTjiE@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaGzzsLMeW2DTjiE@ashevche-desk.local>

On Fri, Feb 27, 2026 at 05:10:06PM +0200, Andy Shevchenko wrote:
> On Fri, Feb 27, 2026 at 02:40:45PM +0300, Dan Carpenter wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
> > head:   a901e8705f89f3616fad3bb6aeddba33be86b08a
> > commit: 014884732095b982412d13d3220c3fe8483b9b3e [16/22] pinctrl: cy8c95x0: Unify messages with help of dev_err_probe()
> 
> False positive. This commit didn't change the previous behaviour. Perhaps
> smatch complained earlier?

Smatch only detected it when we changed to dev_err_probe().  We could
make a check to detect the bug in the original code I suppose.  Let
me add it as a todo.

KTODO: create static checker rule about positive returns from probe()

Description:  The cy8c95x0_irq_setup() is called from cy8c95x0_probe()
and probe() should only return zero or negative error codes.  Make a
list of positive returns.  Then check if this is a probe() function and
we're returning a positive.  Ask on the smatch@vger.kernel.org mailing
list if you want help writing this check.

regards,
dan carpenter

