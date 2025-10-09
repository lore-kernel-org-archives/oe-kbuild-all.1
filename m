Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0094386331
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Oct 2025 18:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760033656; cv=none; b=is+KNXtsYkAK2xBGXsBZ+SnlL42nFUbh/zOa9q4qzYDkdbLcV7RSyGcigfn5fJshivVKB23u3REG3BcgDgvRMO48/sbQCFMlNG4JkqgtZ21Q5fKtiLfsvkbZV03+wsTuum5uXracEIsgkrrkMEYVfjN8n/wJXSL7KI1AIQiltSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760033656; c=relaxed/simple;
	bh=Se0ggIlBcEjUSR5vPSSxwDuywotTlhvRBXIE0uhueKk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GA6rg11VF/MxsxQE9CqblCYuUeKMlgsRXSaSNUKJhZc33aNymFi07WAhwD5CFPkLb+1lzUQxhe9Ui1torwPZb09RqFD6bW0qIoYQoAUk2ymK125QDD7Jss19FfcHNBEDN9MyPZzXSmnhl3lgK9yu8njtEEH56ZUPeYGAmctPKfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Brb9Ux7t; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Brb9Ux7t"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b632bf035d0so66162a12.3
        for <oe-kbuild-all@lists.linux.dev>; Thu, 09 Oct 2025 11:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760033654; x=1760638454; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Se0ggIlBcEjUSR5vPSSxwDuywotTlhvRBXIE0uhueKk=;
        b=Brb9Ux7tU8FkODqRB0yE95P5AulMf90PvEEozdbQnIjRB1tAKDqkxt/0YvcA1hU2LZ
         F80a/1rJocLxqZpz90rgc+QIMUYGvxqzluCpUEOI6oEvLNgWbR+u/zErDcGCNokDmUbt
         NKX9/DACjnlOqOfAxCfzjpYSlTnkNavnPb4GbU3anCe457bhSHitYqzAlhQU8np+T1+P
         ECeMhr97ikQM4ksLCdbGJvdF0hSg0I+HUpa7U+OUgJcqWePssGh0nWJ97aFRtfXttrnc
         VUB37OHS79aVmlMOccLLqnlfVKPJlctVuUpdtJBDnYeuXv3bpeppxuIz13RIDAq+hMjn
         uUOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760033654; x=1760638454;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Se0ggIlBcEjUSR5vPSSxwDuywotTlhvRBXIE0uhueKk=;
        b=ZMARecL8Tm8ktXBchbgnoWkA55bPqrKRJYSlC5TJ16GWr/5tzWWh49k9u2+y9Z2+dZ
         hij4zdlMvP4TYtvPrxhbRvIhajHqIqY7CdXrvtJ4xqjVQVxv/KSqVd8B4n69FDILEhte
         ngaPE0K46Qx4D4kx1PsRDlbXXLICTIy7o3cEOfwdKUMLzbNee9oJ0BIFfyG2r+2seoZx
         AbpJqLQmGLx++/j1pInpRasK0g8isNTAoFooIbzml5gzYdvU1B3jFYFDt3mje8fFv2Ax
         +QoQ1ZMXOnCX+oNzhZDDHvip59pZOA7N9Nh0SPhR2OksRh28ItSS4fgjNV9J28s5decF
         8aEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMBFcjC5xk8V2dtQNabKmIgMvf74ovZK5ggENxarxifAKcC6uGIzvY4t5nOCfvb8qmFrkiUpG/39xJfTC2@lists.linux.dev
X-Gm-Message-State: AOJu0YzsD5Lb8bmVDPCk48OojugQCzhPsAzkFg2lD9qwbS4bR3eY+vxY
	JgGPhN9icKp9A0AXZk35SlSQeZgpm87uavJkG8HUsrXsssNfKONTEbc85/y5gqedMQSwHZwb9bN
	ji0DUg6jfPDPDwDUTwdcidKJZ/D0KGco=
X-Gm-Gg: ASbGncu/EpmG5ktnuL2GCExGuXnCFzQ1rXyx8OusW/PIEHDgGPmsMQM6/3wZMJdXg4N
	8t+B5xc2bHDutDTAO/O25lHfmM8taCOUT2bsz+tCjixy6lTwLcbCSkie/sT4xfyhLMszN890ZbS
	LWw8LMMli37R3xyYy+VLeU8oJe3q4K4Qh48pAGYh1pyoWCKPTuHpdU8Yl+0wblkxYmKWwaH9Hz2
	y+aAY+q6Rb/anQB9ZzFWDCvvZdZ0ihMjsrGRF7cLwBI2JCekILn+OUk61ZfUd2Q2Yk+dwlZJTN1
	BeplcCC9jFGBXet50ng4VFyQw6D8MvWEoNvZOB/1C4wLFvHqRw==
X-Google-Smtp-Source: AGHT+IGGPYXRNsSxfchYlEX7hmMR6KUS05w+/U5AckCkquWjVaqc6cm6OPP4NlzecvU0kbAiqldhBLf3tX6fgvs0CJk=
X-Received: by 2002:a17:903:18c:b0:27a:186f:53ec with SMTP id
 d9443c01a7336-290273040acmr66870915ad.9.1760033653987; Thu, 09 Oct 2025
 11:14:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202510100127.yuqhg8uo-lkp@intel.com> <20251009110555.29a67af19f5cc4d40e66713c@linux-foundation.org>
In-Reply-To: <20251009110555.29a67af19f5cc4d40e66713c@linux-foundation.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 9 Oct 2025 20:14:01 +0200
X-Gm-Features: AS18NWAfpscSsC1ClYA_YRgf8xWotiQcbCSD3SzI9XzV_-V8UQWJVV7bXNBwDfs
Message-ID: <CANiq72kKSz=UK+O4tnV0Kmw_HmJhJJ+KNZnUBWtOWqanrG+7Vg@mail.gmail.com>
Subject: Re: [akpm-mm:mm-new 36/102] error[E0425]: cannot find value `VM_READ`
 in crate `bindings`
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kernel test robot <lkp@intel.com>, Jakub Acs <acsjakub@amazon.de>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Miguel Ojeda <ojeda@kernel.org>, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 9, 2025 at 8:05=E2=80=AFPM Andrew Morton <akpm@linux-foundation=
.org> wrote:
>
> Alice, Miguel, please remind what to do about this?

We can either define helper constants in
`rust/bindings/bindings_helper.h` for the ones that the Rust side is
already using (like last time) or use `enum`s on the C header.

If you have it in a branch, I can prepare a quick diff for you to fold.

Cheers,
Miguel
