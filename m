Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F773A8CB
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Jun 2024 10:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718533136; cv=none; b=RM/2/N9oKzKXleQ06TLGuz71CCzk6ZxLWwYb09z3DE8sqBWesJFVg9lggweMw5l2xVnN7v8/jWhCvWGwHtyRwMYKRawUdtUHoNB9H+icGfH7NH1khlztJEm+fMfFrTcsjTpZA2g5lAln2+NuoiHvyAJj259I39aEhIiyWbGZAms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718533136; c=relaxed/simple;
	bh=dpSVKzcy8lgXSiApirUM1+EjWFhLJ8jcu2KS/9WFTlM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fdZpMXXJrQnr+VlZFNp5u6jlENBH6YNfCLnvYPO15xFJs8YMRuyWukACq1kMUy2YcTdbA+GH/F+ZyxBMkZy6Bo6TKJIDYMuaERi2bPvx+BqtzkNDmTsuG/lL94ow8jTIEp9LMa9n7qn6KgpiT6oJ5UbFXNZcqXLkZGGG6wqhr1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IKY2Tj8d; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IKY2Tj8d"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2c2dee9d9cfso3091067a91.3
        for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Jun 2024 03:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718533134; x=1719137934; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EQiiGkPR1cOhuwccnCPSboJqnrnEfKZSO+pVGQ9Simg=;
        b=IKY2Tj8dlonmw15UDFFQO8i8xC/wI19cOkcsmtF9Nfxl7Mp25RJGbzCsqrLK3AECME
         U+l9zVDwRst6o73GCKoCNQSvruo1rfXir1QuNqcY+kNnqnybi8d7A5ogm5R3YqrXd6gv
         fB5fCoew7CYQULJ3tQlGbYD2nPNgf+MpLuBxq24Lnx8lpEITFHAyZ2Ca7QUwM2wIM7bD
         N+qHzLyN8KdCYKa6WN1TO/NFVwnDi6qxwE74R81hUwJQgkYU1n2/qBy/I+OPa65IUEUC
         yg8y4sQt3ViqVKjeyAQbSsonzvGNDDs/gf08QvIZNagfWjDv9AAY4YrH+fk01LZECXqq
         93eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718533134; x=1719137934;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EQiiGkPR1cOhuwccnCPSboJqnrnEfKZSO+pVGQ9Simg=;
        b=hKoGDuTDbxWmTs37bOPLD3Dz2WuAVEC20wYq/DJFM7H5CmLGGHwUnGjbJ3gFza+i+T
         KKOTo1kyAxWEve8ZrEF2B1RAWZ8smmLTtirwZ+eYDWkGG1+1i5jSC81lk6FeivMS4am7
         m4haj3IbaAmESmcxBlSPE0oDiKp46PsdTpyT9Y7+5bJB1uhMk51zVYJYCsY2BHpkWhQW
         +6PvH7wCPkoVj5cWMBah917pLbKvE8VgqvDhwzAelTsuc4tF8dyarYfZ4vGj3qcXN03x
         c0ncf+IwnS6UpVT6055ZXP39VANm/kxahLct7mLJ6LvI5riQgJGTaSqpV66VbfVUujVl
         I2Og==
X-Forwarded-Encrypted: i=1; AJvYcCVbM2gR9XSKqrI/CQzuO8Ccek8aOx82JbtaLPzw8mlp2qG4YgPs0n4SDPVS+O8ddX1GwrRxed4cz/2mg9BlWPh1yhoy3AdUw74ILl41PA==
X-Gm-Message-State: AOJu0Yw2xtwQ5nSSMmb3/edm92bxKAIaCv138tgWvcaCCoA4pX0jFOIE
	7tMYtSnl+sfQSBVuaJjjCz0PDRw9AJd6oXNuXFLEgQdftvLDvuSStROxllZmNvR6ycOjG3gY7vx
	cCM6VdQN/zXjnDzZws8Hqi6gIBw4=
X-Google-Smtp-Source: AGHT+IFf0/ET6ShVs0FlDrOnBX8qXyLvnTl41W9j1v3eYDECrSVgXTJvMGO5X71rgiXTOtlGdATEdSjhJVn55YQMNYQ=
X-Received: by 2002:a17:90a:640e:b0:2c2:f081:f849 with SMTP id
 98e67ed59e1d1-2c4db1320fdmr6091701a91.2.1718533134157; Sun, 16 Jun 2024
 03:18:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202406161537.8SBTYvQm-lkp@intel.com>
In-Reply-To: <202406161537.8SBTYvQm-lkp@intel.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 16 Jun 2024 12:18:41 +0200
Message-ID: <CANiq72nLzt65vonFv8s1kxcOd3rxOfcVUC3ApaxWJg8XjmOjVw@mail.gmail.com>
Subject: Re: error: <unknown>:0:0: in function _RNvMNtCs5QSdWC790r4_4core3f32f7next_up
 float (float): SSE register return with SSE disabled
To: kernel test robot <lkp@intel.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 16, 2024 at 9:40=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> >> error: <unknown>:0:0: in function _RNvMNtCs5QSdWC790r4_4core3f32f7next=
_up float (float): SSE register return with SSE disabled

Thanks! The fix is queued already:

    https://lore.kernel.org/rust-for-linux/20240529093336.4075206-1-davidgo=
w@google.com/

Cheers,
Miguel
