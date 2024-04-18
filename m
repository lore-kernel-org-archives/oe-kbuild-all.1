Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8AD3848E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Apr 2024 01:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713405427; cv=none; b=bYaE9gH765NqD3iuujZH4vty0nLaPPJK3dA5xyOawaPXqa4cn54fSCBsQHS+fvPdn8eItPq6Jxxdzssif+n9gRr24AXq0yTUDncxKUfFY2c7y67r8UtMUeYxe9Gcbf0izuCJOl/Lgb12l/vYz6r69gwO1bUfTIqmAelWu+eDW8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713405427; c=relaxed/simple;
	bh=QsAD+ftPeuP2BMz5srL6CT36Pr9ABvO927F+/cWGvNY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e6xjr7oXTFaN8x+I2dU2vTP208Vl3HSmEsZzL4YWz1RusCIPW1+5jue60yQPiZYxO1bI55PUf2S3TIzhZOCfFPt8iP/17liF9NbyMqE7qweIisSqTAe7LdUwc+DrfzfyxPnMJlv7lLVUS9abopMDQoTXUmUogkeTxCqSmjLh+10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kx1lCSYB; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kx1lCSYB"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1e3f17c6491so3316025ad.2
        for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Apr 2024 18:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713405425; x=1714010225; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QVPWWWw03SgOG7hN4oN/lVGuaX5+GKWGYBH3cDrZono=;
        b=Kx1lCSYBsrECNkfe76uXXik3ZEzdSipS0qAmWOjuSIlTqPAgW8XHkJLLJSV6AD/p6a
         ZP/MW/+PjwUo0RHaVn+KAVGy/oMipc7FJUjKZtjvHlyE86nGLHcDfI4IqN9zuSal7SjQ
         364nMlIIolZduHrgSeleog45I8ZYnyTGBxcVnzmVIaizUTvlDKzad3PimisW3nJwiSA3
         YORBzYi4VL+W82HwYDbmNOuq2VQ4cyAeKRPcuf/7RZPZYD2VoVDFVxAmgfYOqtDcnbgx
         wCgzHZ6zTyaI6EUfcVQk7AI1O3z8rD8yjM5Y+E31k9aRG+f44erKaO1thbQLUb4Xqqaw
         LCRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713405425; x=1714010225;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QVPWWWw03SgOG7hN4oN/lVGuaX5+GKWGYBH3cDrZono=;
        b=W1zuGCl9/5+JlJ0A/RSXyG4tsACyzW+ypb1/FytDQ5Ji8Fu5ayIs60pkUbP5Jl5zQH
         GGFFgFAKAeLG9DQ+F6mELV+2C01nYByGBVcVVlfdeWC1JMMdG90x3M06HxNdNqkg1yrC
         5Dzh1LBZFKrMjhYWa/ADEQLOHeB8yKFb3IPrlSSkATHq0dGBK3yRj4OYe4gJD4NqPR3J
         R0O0TJ4lJxsm/4ZuCWMdlYUEgGLagbt03rTTCjh7ec5doJJr3YBSLdi8SqNoFcAYKvz9
         18xKcmbmo1KYlmGTn8HAd0ovvdSf6SqRL2WSJJOoxEZp0sqO4tE9ItPFSZrWuuse2sFi
         1gIA==
X-Forwarded-Encrypted: i=1; AJvYcCWKYxo+52BbSFYlOnLA4bj+zcrkV/xr7BL28wqpHS0EWFDfINR9kVWIr8X7RQrbCc6DLQW7XSX/aL6BnDDe/wqAnt3Zdczy4iawT4U0QQ==
X-Gm-Message-State: AOJu0Yw75RVUSyiiH4Vi0ut10xdzmkRIFo6kMJecXLfaj5pOoGwvxPNF
	qUPppBFIrP0fqJmLI3OUNZ0R03xvX99bvjtESg8N7ldaAfMIR8c1
X-Google-Smtp-Source: AGHT+IH36l8aWeB7HeZOGt0804I8gVZpYPmMdR6b00QB/8KTp7k/jB3fbLQ3KKXk4j42Aki8Roj8mw==
X-Received: by 2002:a17:903:1c1:b0:1e5:8629:44d with SMTP id e1-20020a17090301c100b001e58629044dmr1534519plh.1.1713405424903;
        Wed, 17 Apr 2024 18:57:04 -0700 (PDT)
Received: from localhost ([2620:10d:c090:400::5:6f51])
        by smtp.gmail.com with ESMTPSA id bf6-20020a170902b90600b001e86e5dcb81sm305552plb.283.2024.04.17.18.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 18:57:04 -0700 (PDT)
Sender: Tejun Heo <htejun@gmail.com>
Date: Wed, 17 Apr 2024 15:57:02 -1000
From: Tejun Heo <tj@kernel.org>
To: Jesper Dangaard Brouer <hawk@kernel.org>
Cc: cgroups@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] cgroup/rstat: desc member cgrp in
 cgroup_rstat_flush_release
Message-ID: <ZiB97v73Fr-wq14f@slm.duckdns.org>
References: <202404170821.HwZGISTY-lkp@intel.com>
 <171335156850.3932572.581386697098608458.stgit@firesoul>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <171335156850.3932572.581386697098608458.stgit@firesoul>

On Wed, Apr 17, 2024 at 12:59:46PM +0200, Jesper Dangaard Brouer wrote:
> Recent change to cgroup_rstat_flush_release added a
> parameter cgrp, which is used by tracepoint to correlate
> with other tracepoints that also have this cgrp.
> 
> The kernel test robot detected kernel doc was missing
> a description of this member.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202404170821.HwZGISTY-lkp@intel.com/
> Signed-off-by: Jesper Dangaard Brouer <hawk@kernel.org>

Applied to cgroup/for-6.10.

Thanks.

-- 
tejun
