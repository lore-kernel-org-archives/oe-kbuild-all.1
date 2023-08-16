Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E8AC2DF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Aug 2023 08:55:30 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-d6a5207d9d8so4228409276.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Aug 2023 01:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692176130; x=1692780930;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3E/9mTH/+AvMkXH4i0+Sqgi8dIJxvjEgvoifNaRzyHU=;
        b=RaIP6fs/+ncUr2gVWIZZHjgM5Q3FhBTojRNqQ/+UJXs5lAL/vmOrVfcoqqQC3SVtND
         Wq+d5dwZlqlEFjNpEtiILQK3g2YtMIGl6tj8OXNjVdkVW3WujGJMKYud2q+SSJ4KMZ4Y
         5JkVoCJoLIAEdfqCjDaQJv8uHJYpHTYQnNDvcWHLa8G8SMCQ2r+eTo/aH9p98iv7ph+8
         jI9rHHG55+xAfHBI5r2iyb23eGQLFaMo8pWsa3AwZouiVVRVydJbqEku7l4cnkf4UbWT
         XufjLY1aipSDAlkmLfvarQXCrBs3pPtuB4tAjCc+hIQNbSCgxC/2Mz+TiHmoE9AgyPZG
         i9Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692176130; x=1692780930;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3E/9mTH/+AvMkXH4i0+Sqgi8dIJxvjEgvoifNaRzyHU=;
        b=OYS7YTMnpg/UhPSopCtlERXUDjPPvyFlmezC9L5XcEoCRdPR+0Lm7pl0ijW5g699LF
         +arsxvroxndKE2ojDxrNx2HlWr0AkW5uGXZiUSutP35SFLohoaLB4jUmPsvIQqC2ikUE
         q/3ZOdJXmMIhkeHXWHhZJHGNdS4VJbHuVcyqOAEA/kqxjaDimW/cljfWjzAHzHNxw7Jy
         8i9tHVNsQoM6afZ8aWtPJOzWvjyW2+3BkxwktrYJrXUF6HQSuCyepjUMMsRwNHpoRMBc
         Hs9BFsh5cYqSOR+MCc+yVCZty2TNxd7k+MFJ8MnYanEoHQfaq5Kzq9IIXeQ29DEAgN/7
         UkiQ==
X-Gm-Message-State: AOJu0Yy/cwgsB6X0xkEci9IoHm65mdANuSp1k1Ng+BXwPNhDffZnRRIR
	qeWeJokwwNAQ/8612ppspev5N4seW0GEFEk6sq0=
X-Google-Smtp-Source: AGHT+IGsMyEbxVjy+xzXPL7P+959bnjQzEIltK0gxJq/pWFg9vRRJlRNtbfSg/OTa/27/ECy07OD/eaT7kFUcrgZT5I=
X-Received: by 2002:a25:38c:0:b0:d1c:876d:2c7d with SMTP id
 134-20020a25038c000000b00d1c876d2c7dmr1622080ybd.13.1692176130002; Wed, 16
 Aug 2023 01:55:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202308151409.tqK1jSIb-lkp@intel.com> <CANiq72kahMbFnJ+nX_P02hkhEAnHi7MnHonABm_Af6Bt+PbRQw@mail.gmail.com>
 <127f9992b25b1fafaad82f533d489f85bf2d76e5.camel@intel.com>
In-Reply-To: <127f9992b25b1fafaad82f533d489f85bf2d76e5.camel@intel.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 16 Aug 2023 10:55:18 +0200
Message-ID: <CANiq72kDtroSmDVTjomiHDwXej78GWvq61PMpfoyb8QKmyXvNA@mail.gmail.com>
Subject: Re: [rust:rust-next 23/25] make[3]: *** No rule to make target 'rustdoc'.
To: "Liu, Yujie" <yujie.liu@intel.com>
Cc: "ojeda@kernel.org" <ojeda@kernel.org>, "tmgross@umich.edu" <tmgross@umich.edu>, lkp <lkp@intel.com>, 
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>, "yakoyoku@gmail.com" <yakoyoku@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 16, 2023 at 7:40=E2=80=AFAM Liu, Yujie <yujie.liu@intel.com> wr=
ote:
>
> Sorry for this false alarm.
>
> Our CI has successfully installed rustc 1.71.1 and bindgen 0.65.1 that
> follows the rust-next branch. This issue looks like a race problem that
> the test was triggered before the installation was fully complete. We
> will fix this issue ASAP.

No apologies needed -- thanks a lot for working on the Rust support!

Cheers,
Miguel
