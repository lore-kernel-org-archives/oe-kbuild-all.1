Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78319221F13
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Jan 2026 21:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767994848; cv=none; b=cVQxD8vn7sfhCeKZLUUP7QRSjmDp4qKU0YyrAdH/um/l/43e6W3oOwZivEFlF02qfcaFmSvOBGq6DZx1MaFNM0mDAw4H8h9bv74EwtsemPhQOGqLYFrKFcpj20sTI5jAbB5/Bmm+HbpGD3ANK87+YLh3szJazmHvIw3y2QKh2Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767994848; c=relaxed/simple;
	bh=/QSJlUBUdWSP+SY66u3JljD/2KGdEYC7dW5U/Cw+/PE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fbWnk0V4GM+JM9sBrR2eRvzAUSr+JVThiJznNP5oBr1QJa8GujcpIYK08Yh+KN7pG2mFsi93pOqCxg8J/8/88vBjHD84augy0xJgCtMTOY+WroUre8j60V2mKf9mbrwtY3TERtYXUGp/w9x5UWpyXzl6IN5vvCrNkchpayUhuGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Vt6i0YVx; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vt6i0YVx"
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-47d63594f7eso28780575e9.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 09 Jan 2026 13:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767994845; x=1768599645; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sCTw4EBCGwVONJjQmcyN+IYawg2li4nH7oS2Xxt6ei4=;
        b=Vt6i0YVxdeEo/uleWOgI12WlrtYqNuUmcHiDcXJ5ODiM7MhxqHZ4FArkeNel1sHDvk
         RS9h4vg/6hrwNQrWaW5ywKgNqUwWoP1RMfMjEfyRInGVBb/6QtO36muVR66qyDPK6ohx
         HzZs3j3et6P65MIjyH5Y+d7dBivLmtNrEyeT1pjdi9vEhVBmz8vUecy/O3KCAyT/yltI
         rs0nKfGaDM7ZD5wO4ZYLM/Qpx7xmfmhaKeNUCB5wO6ceLR1j2QaHmTHescr999hh3BWW
         VXSZPihq73m+QydoHJammHZ+45Db5wD/NGwvyjn+Bzbqc6g5H6tS7vYwqmoIsaAm9HaT
         QrzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767994845; x=1768599645;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sCTw4EBCGwVONJjQmcyN+IYawg2li4nH7oS2Xxt6ei4=;
        b=YIbrVKMld2VVgho0mkw9KFSf8i84Qgqt9h4Q7TbTpSej1wkPf/UwN2SoOMA02QFYRp
         QdFnB10TeeNQq0aU85htX8DPPGwJdzmfDtcTN+dNaTYIemDBPfTnynW+uAOaGo01o8Fq
         COEgykLvzxYjAuaEDdcKGJWmbvTk6vnxgElc1u2AfEvCRE3e8RNGvFLeuAWmm5PALRft
         O1OGt2oVFqq6iMk5k6EEhabiFwx+HLRvDSFhI6fbBpASJK79YerM+hGaDmEBYAwh4X9e
         E/gYocH1FFvjXrVu8TYTsxo7uWQKaV3VPNjWOaivEqs1oPh1ZdD9csA/WkiH6nFHE042
         R3NA==
X-Forwarded-Encrypted: i=1; AJvYcCU1jFP+fkF7my0wPkcffO6aUCMt/i3YEpiUKY2jpioRiDG0WXYYfsvbYhOKckUKeAfhRC0O/BbtOcu7dBTl@lists.linux.dev
X-Gm-Message-State: AOJu0Yy82Q9gfFi8n1kLX7zq+5SG+wkmr1KuPxWfu/gO9sPg8nfvosFh
	CIS/tIf8npNZ9zyVbxqlOD2+bwFedfPbUlGmWnZHmglZGqarCYLgwUoh65MdOStW8+o=
X-Gm-Gg: AY/fxX6qapcU1OG3gslzpEW0rIdHS/Yxkq3WKFoZxcNaMnynCtcfbbRWzNrEJ1tlOX7
	bIHpcwpsmieDE0Yw8F0nv+xkRSnwXfc7fsqkm5hZ7a1rZITaPErZ3sUeiceMe4+GJ6yMhFMIYuo
	rRMThyCCyJ8jvevoqmojxJ6+7vkw+W88enV1UVARqDbnnO/oNGFwjGUQOYcuEya+tcmOf0R/qVe
	AKeU7FT+2cX7er/4iOC2C3uITVaxYygbyjRSkuxXQK3llvvC2kGTdDzjLG7LpsnT7T3+wb7LLSu
	wYnIGQOweuJu1xHOHy8Akksp4NhQ+pD5i+Xvmm2C39/jM7ZoMmKsZPaTg+6dIX6QyruJ4U81HxM
	2p8egB32479YJJcaQVWqYRSYMP2mi5xzFBJ4BnqdJUj9wM3eAGj9Bh4Y4hEJkE8rNjKgBgwqNvY
	pogFdrj5PeJHu3MlKw
X-Google-Smtp-Source: AGHT+IHZeutMutt4esVNRapvQ9J/Z5RqsU8ZQldTS4RPxGqd9QwuZ9aFqAW34NuikYYDRpVsKKDUiw==
X-Received: by 2002:a05:600c:4fd4:b0:479:35e7:a0e3 with SMTP id 5b1f17b1804b1-47d84b3b687mr128511495e9.30.1767994844639;
        Fri, 09 Jan 2026 13:40:44 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f68f4ddsm235668775e9.2.2026.01.09.13.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 13:40:44 -0800 (PST)
Date: Sat, 10 Jan 2026 00:40:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: oe-kbuild@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [PATCH 3/5] tracing: Have tracer option be instance specific
Message-ID: <aWF12Wjv_MIKu6hQ@stanley.mountain>
References: <20251105161935.545400234@kernel.org>
 <202511071533.domGENBS-lkp@intel.com>
 <20260109102301.19daeb27@gandalf.local.home>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260109102301.19daeb27@gandalf.local.home>

On Fri, Jan 09, 2026 at 10:23:01AM -0500, Steven Rostedt wrote:
> On Mon, 5 Jan 2026 18:23:31 +0300
> Dan Carpenter <dan.carpenter@linaro.org> wrote:
> 
> > Hi Steven,
> 
> Hi Dan,
> 
> > 
> > kernel test robot noticed the following build warnings:
> > 
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> > 
> > url:    https://github.com/intel-lab-lkp/linux/commits/Steven-Rostedt/tracing-Remove-dummy-options-and-flags/20251106-010511
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace for-next
> > patch link:    https://lore.kernel.org/r/20251105161935.545400234%40kernel.org
> 
> This is an old patch (v1) and v3 fixed this issue:
>    https://lore.kernel.org/all/20251110234341.767135255@kernel.org/
> 
>  and v4 was applied and is now in mainline.
> 
> The patch you are reporting on was sent Nov 5th, the fix was sent Nov 10th.
> 
> Why is this sending reports about an old patch that is obsolete? Is there
> something wrong with your setup?
> 
> -- Steve
>

Yeah.  I appologize.  That was my bad.  I accidentally was looking
at old emails.  I think this was the only one I sent, though.

regards,
dan carpenter

