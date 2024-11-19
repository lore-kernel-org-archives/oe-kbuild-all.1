Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61981CDFD7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Nov 2024 15:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732030315; cv=none; b=WaluiJb+8uvokrpFweeMCi9+Gu/yjWgV7Kxw0TVAWGs/MNNMXu+obYMlKHi0fQNN2EQOTjyRXVZ5xJxm4VaVSbJ5RhnflH79LANVzCo6I8CRRw9oF0I3qy71jjQT7EWS44j6EcoRkVl+pnR/oIfk7r7q+b0AHDkzbJhkm/LxKvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732030315; c=relaxed/simple;
	bh=nJNfO/bwZyhb4bIR1ODhbOeQ+Qaqt3sJfucPEncnRCI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gz7IP8xQt0HrJgswxxlLseW+ADVjkbnY8asPUSZ+bzkg84SM/RSJsCY4YnfE/757FiTPzlWUP6CJjeaXKW47MzlPDGiiadTjzRe7iPIDzQ9BJY34b2Ma4O80WOQqq71JGWUh0MG9A7o23aD0g7qOS1YEOhInr1T7IDgwXJLtlL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AFiO5U7M; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AFiO5U7M"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-432d86a3085so31301995e9.2
        for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Nov 2024 07:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732030312; x=1732635112; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nJNfO/bwZyhb4bIR1ODhbOeQ+Qaqt3sJfucPEncnRCI=;
        b=AFiO5U7MTKyY8I11atAvEVWWeot6bh2+kkj6pJ7EGJfzubdDOcoNx+K7unlWic3Aq/
         ANx0pVFL9Ip8/uEWj+Ry32XZCBMyzhy5hwvTUbj4CIOu9opkp1420M1mic2YhkVMT91l
         6YnIIGjQ33K2YmACa1v5hnympfDf2eh9XJJvemXGcw/2hn/vR4peisyHKp1kjclKTeUA
         GV3KLyftbRIFqSxzOr8B19Ygwmu5RCdT9HmRbeOv7P7axOK5/tfzaVoZPdK1oVbDA1Yi
         ao5U1nPl1rfzwFxyl/fWl5NyUZpZZ9KhK9EhQrCmfLGNMO9tZMGuwJE7zrMiFGUjpMsv
         unQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732030312; x=1732635112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nJNfO/bwZyhb4bIR1ODhbOeQ+Qaqt3sJfucPEncnRCI=;
        b=HTnD9n4HL0k3Y+G1yBy+U/BW2qUGdpqcBrc3KCPlInQgohgsRftJpgblJ8PGq+TJ47
         XiWyguV3w/MLDJYSEy/BLA/E4tdIYnfw6K+Vz4QULhrQ/TaCMkw2QO+8uGmUThL0ftyH
         Rvtx7qAazvkJJ8zDgU3QVcVXdUpLq9IjHSqYoZugLCaCyiZb1JT0MFRDt9lij0rXIaqO
         Vs1GM1QLOEKmdtxaM0BMELB9lnDakjBXXzxtg2LZDknwBZvw6XEo0xZlQdov/81Y4AOA
         vC0JHdYjuIa+u+/n79kG2VAVE1urXgN7GO+1Z9Oydv/haEAQrT5T5n7OOKiTaDqW+2yV
         xrgA==
X-Forwarded-Encrypted: i=1; AJvYcCVw+Oo/7FaR9jXW/kv1hqEEewuGvqSeijOM8SzEzVPo+sIFsm+O/8dMZMBOnWNQuuI86BtFnOON0XhjxdFp@lists.linux.dev
X-Gm-Message-State: AOJu0YypBy7wQQYm2OlAeEvjo+Endu0A3DHrAlDPfJlc8J22o4qgagZ/
	BcBdjMkOUkipQ2YMJ3z5R+A6A/XJs0pd6I/ToDy/8+HxIaWGe58vnfjCCUHSZML359yonCP2XlQ
	bQn2dZ/+trnifPjvgKyuhEfjdQUV7vn0eqL35
X-Google-Smtp-Source: AGHT+IHyc1gfR30/9ccinwyjnWdNj3QQZleX0xPYSYr/TPzZ45QLzWIk4oq4JbY0vFb8hDr91FcbI9kQKzugEZDc7SI=
X-Received: by 2002:a05:600c:1d0b:b0:431:5f3b:6ae4 with SMTP id
 5b1f17b1804b1-432df74ea76mr165756915e9.17.1732030312126; Tue, 19 Nov 2024
 07:31:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202411181440.qEdcuyh6-lkp@intel.com> <20241118202727.73646-1-aliceryhl@google.com>
 <20241118182818.7717993c@gandalf.local.home> <CAH5fLgjBpz7bPvanupPSsJx3fjLAa7g7nMjLgSxjEde_KDGV2w@mail.gmail.com>
 <20241119101233.19005043@gandalf.local.home>
In-Reply-To: <20241119101233.19005043@gandalf.local.home>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 19 Nov 2024 16:31:40 +0100
Message-ID: <CAH5fLgiyWDiDFAJO-LDj_ZdRjSnqh-j7vw7URLUm8ZHiFKfGXw@mail.gmail.com>
Subject: Re: [PATCH RESEND] jump_label: rust: pass a mut ptr to `static_key_count`
To: Steven Rostedt <rostedt@goodmis.org>
Cc: lkp@intel.com, boqun.feng@gmail.com, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, ojeda@kernel.org, 
	linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 19, 2024 at 4:12=E2=80=AFPM Steven Rostedt <rostedt@goodmis.org=
> wrote:
>
> On Tue, 19 Nov 2024 09:36:38 +0100
> Alice Ryhl <aliceryhl@google.com> wrote:
>
> > I've only really used the sample in this series as a build test. The
> > bulk of my testing has occurred by using this tracepoint support in
> > Rust Binder where I have 30 different tracepoints and I've been able
> > to verify that I can enable them and so on there.
>
> Could you modify the sample code to have a tracepoint that I could enable=
.
> I don't use the Rust Binder code so I can't test it. I use the trace_even=
t
> sample code for selftests, and it would also be a good idea to add the ru=
st
> trace event sample to the self tests as well.
>
> Would you be able to create some simple code to do that? If you add
> something in the rust sample code, I'll add it to the ftrace selftests.

Sure, I'll submit a sample which does that for the 6.14 cycle.

Alice
