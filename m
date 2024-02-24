Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19855138A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Feb 2024 00:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708735525; cv=none; b=YyQYFRvTSeNcollLeueAss4VwV0iDik4OpNOrsJFjCC/JS3kymrBVN0DIlZBD6OCHIimiD2wAuKVqlBMQtRUQNXTDgGqxPruMx9EVBZEv6zK3/MQB7TxUGlKVHUiGULaafyJaAWMvkco/HTF4qd9bpT70Zo/KFZGLRmi2GZY9CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708735525; c=relaxed/simple;
	bh=wwBGta8rsYppsBWH1MK5Lu84ZHUUawgwg/LAReWcOsU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z2C/1eXxotqdJRkIbUSPfqCrDiPGX+FjTccywUJN/GJdBjRf6694GYm3NCafa9gFSBaVcxURoycMeznrVHbaukGzsowORpCZffRc70JqWGhDrJfkwyeSrs6J+7lfQHzILgRJb834qi016NFGc30os5rL+Q0rfRH8c8LQCTgxu3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ix2hOwF3; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ix2hOwF3"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6e45bd5014dso531020b3a.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Feb 2024 16:45:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708735523; x=1709340323; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tUeKnR3LMixiFFyd8gyHkf5Tdbkx52LSxrPHT0BNkVU=;
        b=ix2hOwF34t7E7ZNPvW5JaxFC7QVx8tBe5MYu23FabJ1WcjXhTcmgfKoAXVtcu/EJF4
         Yzor9qdDDLYkX5/THxxrGDlHuYCVkC6C7UjxQT+1VC0mokgMc19ZYwJLfWacZlyRYfY6
         kqCDye5IAHOvsJCghZ9MCtwSkFBxmRuakH3i4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708735523; x=1709340323;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tUeKnR3LMixiFFyd8gyHkf5Tdbkx52LSxrPHT0BNkVU=;
        b=pR1Fe/VlUn/n0mzDOMF9/TpKCzyLs9wOBiMPjtxaUU+266xZYfYzCrFJP47vg20q0T
         wUi4LkqKNzOaT5IXyFRWmIQ2o/kyH5tp0+ZIb3dRMqxuadGIi9GSwHSNBN/w2/7vDeMZ
         8hEw/v5L6e2v9fdULH4ND3lF+hhELBRAU0naAenKBXSqPRp/VKqxHPK2ZE5Hk0G5DZ1v
         2GDwDmALi6wnnMsr6K/N30F2uKIw+WnMH2SrjBqWq3YGw2sWJvba9mAxDvUthf0qxv9i
         sbKe2qa8wH+qaaPcxwhgi+pD+hpeT+0oszxoxMndp/q16+XcV+JwIWJdm6Nwc4UZaCtg
         YqNg==
X-Gm-Message-State: AOJu0Yxp01TrTRs9d6SIXW2DhQgIH3T55g5wuTEtMNdr7jsTncC1pjmh
	z2qutEUfX/g6ZAg4hyOgiqre863XcTF/KESTin9uOQ49Rc6xG9HHtTqhAR8KDQ==
X-Google-Smtp-Source: AGHT+IG7BlDMOQj+8OSCrwtGtPQm3N2qjpWZIa3B5luiHj+fyLhP2wlMIDXrmivw7/Fg5agY1c5TNg==
X-Received: by 2002:a05:6a00:9aa:b0:6e4:f307:f553 with SMTP id u42-20020a056a0009aa00b006e4f307f553mr1102375pfg.5.1708735523332;
        Fri, 23 Feb 2024 16:45:23 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id y5-20020a62b505000000b006e4cb18123fsm77412pfe.84.2024.02.23.16.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 16:45:22 -0800 (PST)
Date: Fri, 23 Feb 2024 16:45:22 -0800
From: Kees Cook <keescook@chromium.org>
To: Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev, kernel test robot <lkp@intel.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>
Subject: Re: [kees:for-next/kspp 29/41] vmlinux.o: warning: objtool:
 vmw_port_hb_in+0x242: objtool isn't smart enough to handle this CFI
 save/restore combo
Message-ID: <202402231632.D90831AE51@keescook>
References: <202402240702.zJFNmahW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202402240702.zJFNmahW-lkp@intel.com>

On Sat, Feb 24, 2024 at 07:54:00AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/kspp
> head:   09e0d17906598c77fc7831c2d257d573931952e8
> commit: f394a8df5bf700bb265f631664fbfb1cb42b69ad [29/41] fortify: Split reporting and avoid passing string pointer

Uhhh...

> config: x86_64-randconfig-011-20240223 (https://download.01.org/0day-ci/archive/20240224/202402240702.zJFNmahW-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240224/202402240702.zJFNmahW-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202402240702.zJFNmahW-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> vmlinux.o: warning: objtool: vmw_port_hb_in+0x242: objtool isn't smart enough to handle this CFI save/restore combo

What?

> objdump-func vmlinux.o vmw_port_hb_in:
> 0000 0000000002d10770 <vmw_port_hb_in>:
> [...]
> 01f4  2d10964:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax

giant movabs is okay here?

> [...]
> 0242  2d109b2:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax

but not here?

Josh, Peter, can you give a clue about what's happened here? For
added context, the referenced commit is changing a noreturn function
prototype[1], which I know gets some special objtool handling, but it's
converting a pointer arg to a u8... I can't imagine what has gone weird
here. :P

-Kees

[1] https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git/commit/?h=for-next/kspp&id=f394a8df5bf700bb265f631664fbfb1cb42b69ad

-- 
Kees Cook
