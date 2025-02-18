Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 814971AF0B7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Feb 2025 11:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739877295; cv=none; b=OJm86gFlyqkUUdsBr99hfPJQG8ZRROgAMB5v4SXTRmLfwZY6CZPTrDatoAYKhb3W3xvG8aYeqWX/uN8lqOJBMX+9Cpm6YhzPll0hGgmlSg/2X5CEGZqvZnO/z+Cwb9Q/y1gap+VhozQomo1WuVSErxXZMW5WVr9Z1N2Gu10q6no=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739877295; c=relaxed/simple;
	bh=e4ePEsIFIVWnVVp7x965KwnUxkPN33NpLp6ekCRE8KY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d/R79nSBPNo0IB+7s9j+89trb2RM/GcPKSSQ+1bN0jKo1k0U+TWJlPRA3UmsoxvyyIOq8TfYKlxP+MexF5qy9byTcHVSRnZ8/D82OAM3AAyOuVUpAf4RbyN6GGIjUjdSkgof4sLaVwWXW5KyIpsO2mKT4kCd+bfTZ4fIpXgSE4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ty/X8o7K; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ty/X8o7K"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6e67bc04a3bso24105856d6.3
        for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Feb 2025 03:14:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739877291; x=1740482091; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e4ePEsIFIVWnVVp7x965KwnUxkPN33NpLp6ekCRE8KY=;
        b=Ty/X8o7KECFl6zLUz6vUwjkhNcz1EQl3VJBMWQqK0xa1POcaKIpQE8d7UISJY0SwdQ
         XbRq4uJzKhwC01Z6gTbGqhJcaV8u0BpqIvaiuPuyzE8ljjNWOiK/OeXCgrdjemeYNa3Z
         +MQ37wpEZbrIGBxHencP4c4Mi5cB4DUqTGpweo8K6lyAFuOAj1S62JMZveT8+ptNlAyV
         QOjpdo7O+x6Q6aqrXOKtoyWLTJPxOC5M7Gta94UHpZjDlqoew/7gKYQQ+SQ0GdGEhe9D
         DaZTGRJKgxr3aclxr68IRdW9lrEXqgj0jqcI8f74Cag153mm8K9ZK8NmagUhcSv0pq91
         X3rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739877291; x=1740482091;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e4ePEsIFIVWnVVp7x965KwnUxkPN33NpLp6ekCRE8KY=;
        b=beBKiRU6P96M7VIGfrL1b5foZKxt6iDkH6iflpX/IQddL52Py3UF/p2P2zJ5WQsPNS
         NZxck8JmiyyzrOSke6O5DgYRWwDw4eKbRbDdhVbbB7M+UCZ+VERq2cqC8gQBqzkJ1Skp
         K3hEi31ArwzTjatBxsOQlsnbeKPUKhSVpaIwxQOG22mZspqTSpkFIuaxGXt4k6ACxoa5
         NoaLgFOqt2B/OG12QcmeMmolI7f7gAfkVA4+XXgZHG8NgyXgnATH4CK7Rdag1Lo5iq11
         Hm5TCrU5bP6IBQ4NcNSpOJYEkPppLIsaiux/NoYhor8WrXCbzMjDIKXCmr35kNHSrJRQ
         nwjg==
X-Forwarded-Encrypted: i=1; AJvYcCVX3TMyXy2xY21In9zjTU64YwlIM4sjIKGdwG2lk8hjMZpT0U0dD1aBjhb2p6dDr8iJoS6K6oswc9Qzff5x@lists.linux.dev
X-Gm-Message-State: AOJu0Yzwt5CQr29M3+R6HHED1+MCxH7haImt0U7OpvtYl2Pd3Y44RRNv
	dtodx7Hly8ZIJh514zJp1AV6AvIA0CE1AXXHZa8NGdUV35nbJnXvqF1wdGp6QvQ25V5qOemkM5q
	rUy9CKkINQXqc8tc9nwxWAuGw5HGAMMiFvLmF
X-Gm-Gg: ASbGncvRUO++DW9BFT1JPgcWTOy1S0VWHjIAS4LCpECBZk9caEVtBANxr+bV7KnlrHu
	EJMUoHw+FAR1MC9TPd6mPXQ7vwA8vTl3XuW130g+OF1JW6va1mOntIecB9yWgiPmksLbxkz4Cs4
	jSNBzXr+USz1hf/KDpjVba/cuEI00=
X-Google-Smtp-Source: AGHT+IF4V0cacABaV3DRhzrTYfPUh4lhH6DNQ3GhjP7RKVEodS0vVCqDlAESE8r3X5h1S9bFpKdk0ERPYFpqO2C0aao=
X-Received: by 2002:a05:6214:29cb:b0:6df:9771:978e with SMTP id
 6a1803df08f44-6e66cd063b0mr215315016d6.34.1739877291222; Tue, 18 Feb 2025
 03:14:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202502150634.qjxwSeJR-lkp@intel.com> <20250218091411.MMS3wBN9@linutronix.de>
In-Reply-To: <20250218091411.MMS3wBN9@linutronix.de>
From: Alexander Potapenko <glider@google.com>
Date: Tue, 18 Feb 2025 12:14:14 +0100
X-Gm-Features: AWEUYZkW-ELgmmWvEUCGBMqnFptxrYx8irjbyp0U6Ob-IrK0R7M-ystRnmQpahU
Message-ID: <CAG_fn=WzE5d4W1YheYN3SPYmVR5=r74zhV-Zhao5xu-Fqi461g@mail.gmail.com>
Subject: Re: [PATCH] dma: kmsan: Export kmsan_handle_dma() for modules.
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: kasan-dev@googlegroups.com, linux-mm@kvack.org, 
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, kernel test robot <lkp@intel.com>, 
	Peter Zijlstra <peterz@infradead.org>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 18, 2025 at 10:14=E2=80=AFAM Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:
>
> kmsan_handle_dma() is used by virtio_ring() which can be built as a
> module. kmsan_handle_dma() needs to be exported otherwise building the
> virtio_ring fails.
>
> Export kmsan_handle_dma for modules.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202502150634.qjxwSeJR-lkp@i=
ntel.com/
> Fixes: 7ade4f10779cb ("dma: kmsan: unpoison DMA mappings")
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Reviewed-by: Alexander Potapenko <glider@google.com>
