Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92909264A88
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Mar 2025 20:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741725891; cv=none; b=TKhnljQlLyE+kP3emWUm9wQAsgvoPwNm2ct9W4GebshKXWykAGJoIMQyRovd3ZOhPHNE22GgXc/Vg4zj4O+K55ptJ3DGXF+6KC/NktheAvk7t933EJQcf4l23hB3ezWXy3KGGs7hSL7cVsnqboeaE8+HhBXDd6IBEz91sKpDLqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741725891; c=relaxed/simple;
	bh=5L8IANelHOxBjXBUu5dZfDsUSMGYSsqPKkO9bJkFzr8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qCS8iCyku0YWT6kxQWAofvvlQ1oaAiCi0+KXeuasagAYXSIXs3EN3/yIlEf0EgStKC0M6T2rEaDCqhiW8sr6sngk7Zhthcs3OBIIp3Bog7AmrpxDju7qLd7Q3tNAk9CyI3aM9xcfgltsFENMEb42JO5LeBlEOpVo2gSrcdDo6qE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ryah/MlZ; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ryah/MlZ"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30bfd4d4c63so46160091fa.2
        for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Mar 2025 13:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741725888; x=1742330688; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=duEJ7EHRSllGfBF79uawWV3Uy3v+U7kXTNnhgt38XQo=;
        b=Ryah/MlZgV4IQ3HH89C7O3TW+YGOQepRLP9FwS5CYkzRbSA6ZgWDF4rvT9AnljB52O
         HKxqWFAOk3c6VceMOWYVlaSwpeEsjlWYTGE6KFi8ZUjv1EBfcX30KC6+fNe4LLhGwMb9
         6ppUOTCbdeA8P0at6UBiDyzP7/wRSjlLMRkkNr6rDElo7spRbX2KGZ8ArMlU5eTT3xeo
         22d9VTF0/2a8sbB25h4G+BJIqV/fFsjB/3yBP2La0BYGONs1o0ihjjQ9O6ceH/D36BVG
         7TeQZ4lOpN+nKIjX0dZV1Q2S9etSNHOU6SwyGbcVZ5jCSpfqJUYI3g0hvC/SYTRd1fYz
         ujIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741725888; x=1742330688;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=duEJ7EHRSllGfBF79uawWV3Uy3v+U7kXTNnhgt38XQo=;
        b=rlpx0kYdfC8QiOIPPkSPrSPd4AzBlzPdHqgCPK6DZh7qBwSkSAfj7nTNgobVZtQCSo
         sy+7b2dQmX5qtLp4bZRZQky0OaK+kCtUEIcRVHVm+oV950GFO4UnYfffnFpH1q3e2OYj
         ecn5Zq8GOx1iqtsZkuWldQzhwXd9RY3K5h0GMFZf1xT9HlRt0Jeck0d4kUhdHc4Vugjl
         VNcnFN4T/oPfl/ZjObTS9CE03gyHtA2Vzruc8HbRBihxLysOlWC7VNbU1b4kY5Wp9xTw
         f94223rKsoiaCNPKiiOsT4HhlR/PQNLPY0oAPRHLGoePFGwU5fJcgvjfpZt9Lt/bXl+h
         qsMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUxobgRJ2npeIpX34a7vpxuxulGo3aHAXb8qAggCiqppWDQiPdbXrkqbtLN1ptzBXfTW8u018NOrNIs4iW@lists.linux.dev
X-Gm-Message-State: AOJu0YzDsQ7Tx/XcFGeW0PJ5/nHQ1REJ9cYTC5r3k/bWgBASu77DpJVy
	CpvqQCtqK0iKwd0Bzu2OR6s2P2W9Q7QzqVab4sX8IxefD1Z2mevqBGK54+/xn1iAomiPWs8jAnt
	DGCcxRul0Rr3C96HgFFSbhMkKShY=
X-Gm-Gg: ASbGncvHqjHY1FH2Vy6BrD1qU07wSEfPs0AA+SV/5GcCoQmeI3Iy/C4W/QiDBmey28e
	zPbC3i8JvBGr5iaxGk8P2u3Kkb02aYBEA1kU5nmaGAF/hULtFaRVYv7ts7BBFe5t7VKjmEbsaD9
	8NUxEgolnZXI7iwtweirSTNAWaj2mx+hQX5345lRtTAIV6zCm2dTgXAo2RDB5t
X-Google-Smtp-Source: AGHT+IG+EedxjC46NaiJ6woC0q3jeU1QYfuO+EC67MspCOQYOYTyXma/NtrOrk8P1gqUOUHGpPUfHHEJRfzzFrm3JYU=
X-Received: by 2002:a2e:7a0a:0:b0:30b:f52d:148f with SMTP id
 38308e7fff4ca-30c20696d86mr19501461fa.18.1741725887429; Tue, 11 Mar 2025
 13:44:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250307-ptr-as-ptr-v1-1-582d06514c98@gmail.com> <202503120332.YTCpFEvv-lkp@intel.com>
In-Reply-To: <202503120332.YTCpFEvv-lkp@intel.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Tue, 11 Mar 2025 16:44:11 -0400
X-Gm-Features: AQ5f1Jrp6VrC5oCAzv7mIYSclKLK180WdY1BUpfSs2ZfWgyDm-P9M5sBgjdaKuA
Message-ID: <CAJ-ks9mkbs9KG5D5yETvOJfeqyzTts1gVZyNAogbxjXbwOreZg@mail.gmail.com>
Subject: Re: [PATCH] rust: enable `clippy::ptr_as_ptr` lint
To: kernel test robot <lkp@intel.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, 
	Bjorn Helgaas <helgaas@kernel.org>, oe-kbuild-all@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 11, 2025 at 3:22=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Tamir,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on ff64846bee0e7e3e7bc9363ebad3bab42dd27e24]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Tamir-Duberstein/r=
ust-enable-clippy-ptr_as_ptr-lint/20250308-004557
> base:   ff64846bee0e7e3e7bc9363ebad3bab42dd27e24
> patch link:    https://lore.kernel.org/r/20250307-ptr-as-ptr-v1-1-582d065=
14c98%40gmail.com
> patch subject: [PATCH] rust: enable `clippy::ptr_as_ptr` lint
> config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/202=
50312/202503120332.YTCpFEvv-lkp@intel.com/config)
> compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b=
5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250312/202503120332.YTCpFEvv-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202503120332.YTCpFEvv-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
> >> warning: `as` casting between raw pointers without changing its mutabi=
lity
>    --> rust/kernel/firmware.rs:64:35
>    |
>    64 |         let ret =3D unsafe { func.0(pfw as _, name.as_char_ptr(),=
 dev.as_raw()) };
>    |                                   ^^^^^^^^ help: try `pointer::cast`=
, a safer alternative: `pfw.cast()`
>    |
>    =3D help: for further information visit https://rust-lang.github.io/ru=
st-clippy/master/index.html#ptr_as_ptr
>    =3D note: requested on the command line with `-W clippy::ptr-as-ptr`
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

Indeed missed this one because I wasn't building with
CONFIG_RUST_FW_LOADER_ABSTRACTIONS. Fixed in v3 by:

diff --git a/rust/kernel/firmware.rs b/rust/kernel/firmware.rs
index c5162fdc95ff..74df815d2f4e 100644
--- a/rust/kernel/firmware.rs
+++ b/rust/kernel/firmware.rs
@@ -58,10 +58,11 @@ impl Firmware {
     fn request_internal(name: &CStr, dev: &Device, func: FwFunc) ->
Result<Self> {
         let mut fw: *mut bindings::firmware =3D core::ptr::null_mut();
         let pfw: *mut *mut bindings::firmware =3D &mut fw;
+        let pfw: *mut *const bindings::firmware =3D pfw.cast();

         // SAFETY: `pfw` is a valid pointer to a NULL initialized
`bindings::firmware` pointer.
         // `name` and `dev` are valid as by their type invariants.
-        let ret =3D unsafe { func.0(pfw as _, name.as_char_ptr(),
dev.as_raw()) };
+        let ret =3D unsafe { func.0(pfw, name.as_char_ptr(), dev.as_raw())=
 };
         if ret !=3D 0 {
             return Err(Error::from_errno(ret));
         }

By the way, it would be great if the email also included the rustc version =
used.
