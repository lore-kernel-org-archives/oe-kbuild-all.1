Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDAB0126F0A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Sep 2024 07:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727248522; cv=none; b=ib0LOMT7UsqJZ/k+gI7OTt2sHYjPraXNotuZ5HdtpmedmjVKTa2BngJcLQfy/o+zLUOOMoEirpK71nGMkmUW8zhircfOHL8+bvs6UMdj2y3qnzwiH5I62m9CWzGc92otwMCTbbtYRrO57hU5QlCpnVAps1zZ78Z/ykwcaOfT268=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727248522; c=relaxed/simple;
	bh=bzDm4Enp3hXtpfidzf2ceHBrZX4lL5SUOpIuF63CRsU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZPWeqcUhgxfXDEi1dEkbm/9nOqNLmYg4xOwlqITx4P8tSUt5G6FuhxPzxoNckrhSHZo0kclc1zhBMJvLGnD9RYE6UeCMLPmE3/TxudzTXoa90PTl0p6oU0QQEExG7OxHzpNab0n8grNwgIn7oVJdD7YDx4XpgTQe51bv0DAKc7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xOGFGgEd; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xOGFGgEd"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-378e5d4a80eso4738123f8f.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Sep 2024 00:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727248519; x=1727853319; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CMsn/bPHV7l0Tw2fIB2aHezcx6bxNnjGnFjV9MafOuk=;
        b=xOGFGgEdLMKF8eh5jwGNnc3wv7KPsAkuWjCQpkdw3IKFcj7Ckix/j5fFq+S5U8fRFW
         hklSZ1IUNxXjY61rWCCExsg76ABqfbHtEkbn0khF18bbx/KvcN99934279n5LTnOqp2g
         TN0CJxrCJTEnMbtAn5j4B5RVct0t37gTJ3EMULCFy5TkyavfoDCQBN2ylivAqyiHv/yt
         AXCyCIak24JG0h4kGeKBktypi9HJU2kBuQwAhUlbFRFEBMwsam6w46OF9J4gnrAagcIw
         XgnNG9QxM/4woN2ivC4xr5kPoBssnxcSCazDNkUkx7sMFZNx218+M2Pqvv+GFWLO9vVY
         hm8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727248519; x=1727853319;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CMsn/bPHV7l0Tw2fIB2aHezcx6bxNnjGnFjV9MafOuk=;
        b=Xa0jhbTSWfUfRitWN8qFiu4zXBbgYb96X7wDBFsJHYW9bpGY6/dvOfoIBssmyYXxFF
         wkCvsU9qQ2LMfExIFHUfvz0gj0VDxz+dTRn22g8s27AzguE3XRalnoVDjYQmisw08O0u
         3nDuJ+fsZVyneA3BIqY1N88mK5CzwanIcGo5LzUIjx3Epj4j6gDK8LrEZgp7YJ/S0435
         4JHQF6vYTkAtojdkggtRJ9QOM4+JAHoHqn2Ch4Ny436iRS0BjdAs0Jjs6hYPoNkynqaQ
         u0phCW+ZPl828WjB6JictvN5L8BQz5YPmYdj2W59PdeuVuZjGa7fV66UV6CgyyAC8RU/
         sGWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzjO6ACdqf9ZxiWUT/BieP4GuO6IV7cXECtl9RNvYTabs1OE9dwNHK4ends6eZ9kvAtIk4x3FtNUVPBV10@lists.linux.dev
X-Gm-Message-State: AOJu0YziGtO66IjjM2tH31JrFeL3ZyYJMVXrjjmA2XJT8HYMkUJZ0Fjm
	7zhyCTvBuXapI+URBwFeXlYy10o7YHTGyNZVCmDbYw2D7qyooLc5ILxnXlX9WVI=
X-Google-Smtp-Source: AGHT+IF7DMs2N1O0IVGGMtrVRngCQqRx58CEUEwL0EQgeeKVizhe2O1tSrDeQaTz7DIsxKIolB78Hg==
X-Received: by 2002:a5d:64c9:0:b0:371:844f:e0c with SMTP id ffacd0b85a97d-37cc246b3bamr1236159f8f.10.1727248519192;
        Wed, 25 Sep 2024 00:15:19 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cbc2c12b4sm3187911f8f.25.2024.09.25.00.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 00:15:18 -0700 (PDT)
Date: Wed, 25 Sep 2024 10:15:13 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Simon Horman <horms@kernel.org>
Cc: Julia Lawall <julia.lawall@inria.fr>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
	Rafal Romanowski <rafal.romanowski@intel.com>,
	netdev@vger.kernel.org
Subject: Re: drivers/net/ethernet/intel/igb/igb_main.c:7895:6-11: ERROR:
 invalid reference to the index variable of the iterator on line 7890 (fwd)
Message-ID: <a90fcff3-f118-4e33-ac7c-303a10f4f4de@stanley.mountain>
References: <alpine.DEB.2.22.394.2409131949580.3731@hadrien>
 <20240923140125.GG3426578@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240923140125.GG3426578@kernel.org>

On Mon, Sep 23, 2024 at 03:01:25PM +0100, Simon Horman wrote:
> +   Dan Carpenter, Rafal Romanowski, netdev
> 
> On Fri, Sep 13, 2024 at 07:51:48PM +0200, Julia Lawall wrote:
> > On line 7895, entry is never NULL, even if you are at the end (which is
> > the same as the beginning) of the list.
> > 
> > julia
> 
> Hi Julia, all,
> 
> Unless I am mistaken (it often happens) this is an issue
> from about a year ago what was fixed within the same
> time frame by Dan Carpenter in:
> 
> - 4690aea589e7 ("igb: Fix an end of loop test")
>   https://git.kernel.org/netdev/net/c/4690aea589e7
> 

Yeah.  It's weird that the zero day bot is flagging this as a new warning
"branch date: 18 hours ago" when it was fixed last year.

regards,
dan carpenter


