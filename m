Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36013EE1CB
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 May 2026 19:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777921554; cv=none; b=m0ZlCPi2FZW8TuZ2XgLd4yVn1D3glOHvVlzJQUYneu6u5a5y7msr0VVmxhTJoja2hUw2Qwm5u4C88kG0zccEWpI2VKIIpdBq3pugafFPEzW/Ij7OoMTt45ZPY2F79N1sxLn5W6arf9H0vUp0YTfj5+YZ3mHXkfUiEYq6Nxg+Hwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777921554; c=relaxed/simple;
	bh=q5HtbRF94Pn54snggSn/E4S0jrZKW4+oCTJyu6Je3q0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KHymeCZjzAsNcNvVmRkn3JDM/p/5ik8AbLUuwdRWc/QRjn9mKiakYbz2i8Mawh6uHf4pxkY8ceIEPtDeE8KITXlvlSXBtvZsHxkR4PGFAVVURXYY2S/qRJPLzJV8bvtrM8HDt1QU4YYeH4cUgUjdBM4uND/D9B23VP/wOANeAHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LFYFA2T9; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LFYFA2T9"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-44e1860558fso949064f8f.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 04 May 2026 12:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777921550; x=1778526350; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q5HtbRF94Pn54snggSn/E4S0jrZKW4+oCTJyu6Je3q0=;
        b=LFYFA2T9+QNkHE2NB1H5lRI6heDKGhtcLeVO8qVXOKy6GlY24eOjod0Sx0p7QTA04C
         9prHeLivqgEise+4hL5/7GZOpFAz3kK7jvrfgohxoqkF86/COLK8a5Us2YJB/VpPWGLL
         vZFpEjwNEbCP2u21BSGy2HgAAnvccH8xLB6USLEF7L8IcT+v9iWWLyZMzcBBWe9ykFbf
         Nzpmm7Ndn1kvUPkFJ4gwawnx0UItgXe0lKSAxyaMFsU6UUf8M191+NEFOb1QKFQYUqoz
         JkNllIYrXksBCrL2hQcIiNNP1Inxc+oyVRvPygMKBEoRwPGsXzl0SP7J7qnPDShN8gzp
         fVKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777921550; x=1778526350;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q5HtbRF94Pn54snggSn/E4S0jrZKW4+oCTJyu6Je3q0=;
        b=tQ/lW2UDkGhO0foHykonf7ijSEnAnHttQepLjqE5lsbb43JihYUKxGWqwQ1C/U+1ju
         lfiXUltFfzoOiz6fw6xMUhX9xhgBztufczeLijNmz9wEA8B1WwgVxTiga6zpxunGTmmn
         moT7qV3i6sE1d+wbLPKrC2bCNELfxa+5VcQQoEVdUNzqxw36umsRU9fxarh7fK3xsr6H
         RH7G0acZOP8nIQ/aE4BeKaJtHc5Nx9BGZfINb+Tapj4wRH7DkV9H2kw3KXiBmCsL3QAa
         qnM4vgI8pQ1sombF+KwN0IrSOtCBTGJalnwOxuuafgHseENIU9hHnnFilMJfScErd7NJ
         sVRg==
X-Forwarded-Encrypted: i=1; AFNElJ95GqKJ0uFSOL3OONSKgqtS4W8k0nffYxJaKi7MxBX1xKGvHBF6kATXH+HfIuIrL3DNeauDQddhiy9voowN@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+V25NuvO4Fl9vWMliMWMFSQGOcXeySNhYvQv7sdHGZEfoPr6g
	QERAtKfAlLhilOOYfjA5Ul0H+rqR2AQdzqigMZO8kRY90+p07gSVB/0=
X-Gm-Gg: AeBDiev0XXwq3kgxY29/WgMWHj8YKYUi56AysAtx6TIT0wyI7Nus51X2X9NuQ4cvzQX
	sRFhDQf7dJx398AbZEFl847GiDGzuK0KlB3qLq04OYMY5UheG0eWbalCnTJAkGCAi58T7B1b6FF
	7Ms0Ym1Jym0Gubt2SFUrorbopOTMHXaleGNsCcIK6Zz/48VwtKjT8UOZqBBnCPmE1BLWsitDVCM
	JrtxRiaoVOTFeDu4RD3E4LGBTYDw8CAxx+mMOw45CPtsRbupkZh253sFMlW5H4YQcvYBKsIJ4el
	3QJAwOdjPkClvhuuL28VAkDxczwE8yU7n4Ynhr3s0Zi0QD9myXGoTtXxZpliE5e31rrZNZSyUdv
	aXUoa/LAET9spRpYUVA2EkaZNo5/T6U1NO4ByPgPd/tYadxTKyiMQzd9yK/dVsWY28XFHodXNMm
	+K
X-Received: by 2002:a05:6000:310e:b0:43d:a37f:8d5e with SMTP id ffacd0b85a97d-44bb472271fmr18685488f8f.18.1777921549502;
        Mon, 04 May 2026 12:05:49 -0700 (PDT)
Received: from debian ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4500d172c63sm85886f8f.8.2026.05.04.12.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 12:05:48 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
To: Dan Carpenter <error27@gmail.com>
Cc: oe-kbuild@lists.linux.dev, Johannes Berg <johannes@sipsolutions.net>,
 lkp@intel.com, oe-kbuild-all@lists.linux.dev,
 libertas-dev@lists.infradead.org, linux-wireless@vger.kernel.org,
 tristan@talencesecurity.com
Subject: Re: [PATCH v3 2/2] wifi: libertas: fix OOB read from firmware
 bssdescriptsize in scan response
Date: Mon, 04 May 2026 19:05:48 -0000
Message-ID: <177792154836.3040070.7814391775444667231@gmail.com>
In-Reply-To: <afYuwVf23vKag2XA@stanley.mountain>
References: <20260421135027.357622-3-tristmd@gmail.com>
 <202605030019.lL8x0ZPx-lkp@intel.com> <afYuwVf23vKag2XA@stanley.mountain>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hi Dan,

Good catch, thanks. I'll send a V4 with size_add() for both
the pkt_ptr and bssdescriptsize checks.

Thanks,
Tristan
