Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0CF58ADE
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Dec 2023 22:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cHFsvtob"
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-dafe04717baso2632790276.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 08 Dec 2023 14:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702073846; x=1702678646; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gxtzKjUFlutfA9hK4IfqNIllKZUa1X9qLK5/3NsQ0wk=;
        b=cHFsvtobrn/bbE2Wn35BnXOEUaj2VJANt8l8S3NX1ZmlBpXmDK8+fgD9G/HkJI+YUM
         SojV2lSx3rISNuXH/+/XGXGrwGZiQoXHcuZ7esyo6Wv+DD7B3awwojwbAVk3vEuwQB9u
         ukh8j6GKXpKZmeSA1L3Xlqrz3T/2smglapXMcY5Y/WqUh8gmpbe37IZWlRFrnohE4yJn
         +B6bXM7OXqYFXJc+EyXhXnDwr56O/0VNIEMaW/tHvbynWN5Sh9+grou1MbrzGnu5DRwr
         U3hIsdPoJnC9DsAPyZcR9m8aSB2P6oLJ/KFMa9Tn56pBw4B71WwGlVOVQhkwbXs+4PvJ
         hZ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702073846; x=1702678646;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gxtzKjUFlutfA9hK4IfqNIllKZUa1X9qLK5/3NsQ0wk=;
        b=P+b+8qVzLHBGY+Vde66lDdwxr7pHrddc3hXDgncpNbc6zOdzXfRQE0y5UkPdy7PznX
         WWKVQaQeGJEobZdbQAGoEb2gTGpEJ8TkcjFSIp+o//+HhdH8rW8SP1eiSCYbAQ04BQ3V
         DeN/XHlKwsuJtwHiblr2oBMPM8L6+yVipDUmgKPI0eKByEawo6UH7ve1nkrxegaBKXiC
         +fEugmDTBnZkAIxoaUc8z8AeQM+Pu3My7w5xe1wk1O3yZY4efTPrlp4JC1V4pSZoWOdH
         aZk6VgJz9cLJFPVyO+N6f0PYJ8l4gm1zOKhrnofH5qxt8mphjMFFdrrs136HckmqIXdw
         /dCQ==
X-Gm-Message-State: AOJu0Yx3pwTDT9AYUayByhFiIbPjv4A7r/VNJQqBOK9GGHi0oD6yp49r
	BI1dzqSUyzrD5TxAVLpOI7TP46+b79yQFuut15DG1Q==
X-Google-Smtp-Source: AGHT+IHXuG1usX9hQqgk2Y4XPkrXLD/KD6rH8hH55ishE7sQ7lzNuKYop8sulwRBU560k3/4SE7d2Ids6sp5NoOViT8=
X-Received: by 2002:a25:ab72:0:b0:db7:dacf:6fdc with SMTP id
 u105-20020a25ab72000000b00db7dacf6fdcmr742739ybi.100.1702073845580; Fri, 08
 Dec 2023 14:17:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202312081716.LUUhSNS4-lkp@intel.com> <CAJuCfpF_FN07Pvn5BJn1vJMAeEPKRBdfT3kWXVD=WAfizto+UQ@mail.gmail.com>
 <20231208100519.aa94b349b45e3b7ff25b3eba@linux-foundation.org>
 <CAJuCfpG_aCQpCSJPTg2SxuhfKbRWjPN4SM6BU-FJMr6cARM2eg@mail.gmail.com>
 <CAJuCfpE0rvr1apUmrErS-9=QsfTMWt_P-a3xJLNLOfr75AXytg@mail.gmail.com> <20231208101443.e1a153ff6d7d753685af024d@linux-foundation.org>
In-Reply-To: <20231208101443.e1a153ff6d7d753685af024d@linux-foundation.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 8 Dec 2023 14:17:12 -0800
Message-ID: <CAJuCfpFiEqRO4qkFZbUCmGZy-n_ucqgR5NeyvnwXqYh+RU4C6w@mail.gmail.com>
Subject: Re: [linux-next:master 5469/6165] uffd-common.c:636:28: warning:
 unused variable 'uffdio_move'
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 8, 2023 at 10:14=E2=80=AFAM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Fri, 8 Dec 2023 10:09:31 -0800 Suren Baghdasaryan <surenb@google.com> =
wrote:
>
> >
> > Hmm. I still see incorrect version in both mm-unstable and in
> > linux-next after fetching and rebasing. Maybe I should check a bit
> > later?
>
> Pushed out now.

Thanks!
mm-unstable looks correct now (checked all 5 patches). linux-next is
not updated yet but I guess it's a matter of time now. CC'ing Stephen
Rothwell to be aware of this.
