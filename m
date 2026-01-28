Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B65349B0F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Jan 2026 09:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769592822; cv=none; b=Wpr7SbdlJYrKVo4ni5gXUz3xc0qtlQ+Hu5nR5w9QIdS8vAzTKDQy6WKvQ0FCQvX4rpIC8gUl3Rid3gGtNWLZiXrzA8yXYo+QVgAOAc6I3LvT65EEP0aJMN1E4y8YPrUpToTDqZ7sM08LcoKi1SMFS+Vytk4W/EO+7l3AJQ3IXk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769592822; c=relaxed/simple;
	bh=uOsFKecVdgOaM2dYn07D10IoSxwRfxK7jQysDzSCj9A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G7cQQAl9J7A5iQR2U+Q1mX7Rllfc2RPApp2RchArec1ZtUIVN2/JNZgp5z5Pg9HCNZ0b6n5OQ9VBzJoFT5M9quJYIwENj6NIoszrOGsVYqI2k7GwzUig9Ol842+n6JyXJWip6WInAhxGDU2wQLHUESxxksmktpr7TD8LSm1e724=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=eRqda9am; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="eRqda9am"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4806ce0f97bso5676355e9.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Jan 2026 01:33:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769592819; x=1770197619; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gZEd4Ae0SjVXdfXDHLByruVc+qFACePuPH2DSSILnOY=;
        b=eRqda9amP8pKWKw6RfoNxUKkTGZuXUa0sY8pATjoKvBlmO8B/QVZpHIiUqxbvsrIx9
         2hV38iKu/0yEjDT+dO5HaOxx7ICAPV4V8hEqqqfGDRjZ7w3jFkotbtM4aOs0c/3Ijqyq
         5hgnnJRh+X/1jOQKzfzXH59eBBXb8IORAjS5yv4R17Ibus4wb0Rzj2o2RxKFBz6wbjDM
         7r/YMZsMDsuZtZZy3kpw64F0/oD45EJNhqmgw1Qzyx5IDJssBuPHRTh16+dW7DZTYhnf
         2ADV0I2cOLELR5DPCblmx/YUj10BkQynfG2/OC63X4zdxqymtTBEVXzPah3aydVDxKLF
         ZMgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769592819; x=1770197619;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gZEd4Ae0SjVXdfXDHLByruVc+qFACePuPH2DSSILnOY=;
        b=T7hk+uHqwHVrpQYhqpmYarE4Olot1bhA0wZolbwYfnnOYBEC2PskRS7mRkPdluVbix
         LP5R0B+w9hdGpMpD2Gj+1r5QjE0b0tW/LTTqrikYgCaLVqCEoo+hxLiJZq+U7sQlGHEg
         os259wWZ2Y4WOKg4VEtmUR1TvOPnONi623i8UBDCbHjV5MuSV3xIYGxEVNNK3txOBs3m
         zjxXQt7Cgu2T6Z/kc2qWG0JglHr9YtXpMkruEkU+Ey9Y2IEWmgTr+Bl6vdpr4QsuP1OJ
         Ca0rXDnVjhEwBxwhYh5gdp7zRM5IH1+YqEZTH8Eikfj8vLGK0lDdx2OpG899BFVHdXTX
         rBYA==
X-Forwarded-Encrypted: i=1; AJvYcCVVXWWuZAYG8on1KgxfXkkQCNCz9YroA39XX6RtWOudPKiDEBlk9utoLIq0EKJF//VRfQb8mlIEtcFFrM6J@lists.linux.dev
X-Gm-Message-State: AOJu0YzOTyPoQ/kJGECIU5+GJILY72SOhILwLkTxSOmZQnRy3NHnICCa
	xxRz6AbJan3ZMwdFRkrgYKApjZ+Py0JtiRndB0UMoA9Jhyf/z1XM7giP5e0uoNsP5VU=
X-Gm-Gg: AZuq6aJ/cXoSC/Kl0F1crISJ92e64LdWyP3gVUNjMgv24loOg8rY7r2bUHydB5kbF/I
	tmrS6yx9LOv7f48190z7eIFRElxDm86IAyNDYvuTJNMF6mixIoMBpVRTsUfDMygHw12ZFtTjZdj
	ygbkrP1NoG4KU8PEJOFEY3Go/Q2RH5ma3sC1zF6DzgRPsZxZw9tltghlz2ZbAdpbTglEgogD0N0
	dGv2W4u/2WQa6IoBv5E17sbMljhAI53bXjFfeIopikCBjbOnZok1zoz1AS29yYWVCui7IQFoQnw
	sq4dA7HE/Cy9TwZmNgtcqEid4OYGFrGPpfOZJW+lHj6Z4rvIvP2+5jX0/VBSSSzrVFlNOt5KzN3
	G6GHtHhkLbSyckuend24Acp146BAALpWUy2oO7UOqA+eosEoZEPLV396oP0iF9DJvDkdDCHx2jo
	Z1Y6WL5iiBmZmP8Q==
X-Received: by 2002:a05:600c:35cb:b0:47f:8c05:786b with SMTP id 5b1f17b1804b1-48069c7c409mr63857995e9.28.1769592818706;
        Wed, 28 Jan 2026 01:33:38 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066c428basm124338565e9.12.2026.01.28.01.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 01:33:38 -0800 (PST)
Date: Wed, 28 Jan 2026 10:33:35 +0100
From: Petr Mladek <pmladek@suse.com>
To: Tamir Duberstein <tamird@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>,
	linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
	llvm@lists.linux.dev, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3] printf: convert test_hashed into macro
Message-ID: <aXnX77aYdsyFBiU7@pathway.suse.cz>
References: <20260121-printf-kunit-printf-attr-v3-1-4144f337ec8b@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121-printf-kunit-printf-attr-v3-1-4144f337ec8b@kernel.org>

On Wed 2026-01-21 11:10:08, Tamir Duberstein wrote:
> This allows the compiler to check the arguments against the __printf()
> attribute on __test(). This produces better diagnostics when incorrect
> inputs are passed.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202512061600.89CKQ3ag-lkp@intel.com/
> Signed-off-by: Tamir Duberstein <tamird@kernel.org>

JFYI, the patch has been comitted into printk/linux.git,
branch for-6.20.

Best Regards,
Petr
