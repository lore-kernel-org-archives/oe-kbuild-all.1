Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A173BE17D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Mar 2026 15:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774280334; cv=pass; b=r56Zi27K/YTpor2OQRLh8Tx5VZY11ppPsuwKu5XlOFaA5kHXSHOV/Yop7tKv64CNyd+lj3QoOi3U+UQSpFxnhR4Ngqy4vRZ9biLBuLK5Fq/vdTbufordFoR1BW6F9FSxJf3BM28ymYPDB8pNX3hyjdrCbSzpmPDCjvZF7qqo0NQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774280334; c=relaxed/simple;
	bh=ZmWh/DuRvSZu1elnpeWrQV+U187fmJiYXIaGuwiNT00=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ALi2YsCcMSPHUcnkngws8ans4rwiNcJvpupR5XM9XOGxFha6mfThIuF2oRAiXyiFujgX+qMRiKe5bpb7QWEt/CIOCeNFLrsbRXtCFcYBuDdSuusugetNbLgzjutMEhZkWsVU/91koHBghfyL0seBkd/tMRU/NDRYL62s000JPLg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UihAU7mh; arc=pass smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UihAU7mh"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8cb38e86cf2so414471585a.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Mar 2026 08:38:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774280332; cv=none;
        d=google.com; s=arc-20240605;
        b=j85rHu+eoMh269MAYWwna6zYE1MOjRMj3j9DONP10Y0jm7RDDFccqKGn9zJwW6ggno
         +LOYPkCk1rZ/Ade0oxuJ18FzWQpxmY2ibXqyROWtzvJfG2gUM7HyVJp7SzQ1ccy1jMMu
         CaMdf1QuNfZ+zhyqkWUP2hSnk6p4GnqDHx5Wl5/N+Yqpoet1o01skWmNNi9UIXWJW/Bo
         fbqDYplla6GIbmdzJH/M4Ut6ddPYo7sQBnXkiFC0tEdZTzJXD+zP+a4oSNzUQvvu5kbk
         tuqWXcIVm0wbUD5XJMxDpcBSp7VKkEUsfvkdTb5JevLb9n+HLvNhOwQ1IHs6lDdMNLmC
         Xx+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WzHQP2pHDPf8b/aNOBFwrKe9Fe+VkqE7R9SoZi1QpZg=;
        fh=qQ1I+6y8jcH7T+h9ErPuIeEmYhwtwlJm1kKuMSiyeNM=;
        b=YuC+11JJ9UoDSrFiJYIGwoUGUO8ABrn0wkNIODFc64GCJzctd8ykQsho1CIIWmTNIJ
         BozM4ahel0ry0vgcqOCJpv0TezYH/0W2AKVbcEUJ7Si80h2FsyiPfntTsWZ65yMmPI9d
         p3CPZjC0yrlMOW86skpl+PrXCRelcO+aFJy+nScDItJ+6U/+QESqbrO+PHT0FALF9HlK
         xD+Pb2UmBr7pTAlqyGPzh53uUAGlCnJpAbcMqAoVYvx/SpzkfVFOfeXhJz9ZRyz2ED52
         dX+d1EYmxamwSb5XWZWYalbmIi4apcVWJwNrUsLJDsXZyWRGJfthD3kARDBKWQy7FDCw
         z1Zg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774280332; x=1774885132; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WzHQP2pHDPf8b/aNOBFwrKe9Fe+VkqE7R9SoZi1QpZg=;
        b=UihAU7mheCqvn3V6hdiD7tzqtZRPQBW5NFRsbUXs5HYNSdgR/62w8j5MzJf1fe5j8X
         8ls1w3gQlpxiN7mED0L6O51EcKeEO28oUMQYC10UaVnjFjGKOvTrN2fMD/euPqDr8JqY
         8m1VmE17ZDkg53vWbOqw3fBn3QQVDPul4Q8VkTz9POseBr8j6YCgbyYxyAJ8UXe5Yz4X
         T5NoHyWZXkuGkbT8+LJpoH+fflzlEBsJYFFLpnu12JKadwMjRQvp3WVAXiT1KLuDROLD
         R41fdjeGlBxYsYAHahLpPw/CxJ8qWYtM7BhS9dDm80A1R2SFbSyjE6GR4Zrm4xgIhHAd
         Z9ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774280332; x=1774885132;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WzHQP2pHDPf8b/aNOBFwrKe9Fe+VkqE7R9SoZi1QpZg=;
        b=fwaOyvqbPilTk7/08cYIgJvNIO6vWnDrovJxAMvXGpN0VeL6f+dSZySg/m6EaupCkQ
         y66JQ0/ys6Y1NUGcUDdi7x9JorrJvs0vFR7mBCHBsb4XzthiZuZYBosJzG7hsOtvkY04
         CTKJND+c1Pet5Za9Jc1eNXT3KZAWgBwbl3bPN/ahy5ZW2aOy4zmjqmKBwuZ1Czc6BO3l
         Kle4JGbZ9xJpFUnyZ0qk5p2eVpXZMB3BtG77/gWZPh+weJXWd7zfSxN8tZPFaixJuiA+
         D/ObbUSziVkaqFxBeVwgvID1bmTmLjUkc86v/2oPJxIeK0QB0BBDjDY2X7xA2lCHquyi
         FW8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWTE29rx/m/bv4YYS6NfrKAnyDrFst+RZm5ykACNhNaA2o/08KmmnIpwNV1AMlMbQ7XFspU7DAAYt6530ll@lists.linux.dev
X-Gm-Message-State: AOJu0YyiCq+BnnhymMnDpCZAYelIFgLCGa96F0grLHi66qmmvm5TKk/3
	zfOE+gJuNCq9Fzib5ksRepuJ44c5O07t5HdRl60Egv8YwxV85stdLauA7hsXFt0F9Fo/Piq4jjP
	D7oEYxPHQ4+E24PXFe5dmHoxeJJDjOSNgnPCB
X-Gm-Gg: ATEYQzx0/6KF60tr45JNTed6uRjEDu6Hj/anBNYrmJXjt8/1VK8duqEpBiIJY7IY9Z8
	eJam5SRbokdsmQJMxM9VS+ib9r0AXYohz3AZtDV9ixXTtsOKEceA7CfRP4Gt0Pl6rXzBGzgBCJ1
	a0vctB8QK49yTGXi2IffzVEU+8mcfsG2A7bRbObEIeXqzkojYmRH0gst/NgXSzccg5yZvFTzjNQ
	OFXXqpeLYM0AzWo7HR3AnHdZP3uNU1bT1ow0t9ttExSmWZ7bnqA+g0Qnbkb3ibpdanXDqV9VR1Y
	JCPuvLfo3M+tUtKp9GUfTqEfDLnkf15loIKT2CCvj1CchzpQ7EKUqY/9883QKaf6kDt5qYuYauU
	DSYOIIR9JYElEOQgnCPVUQ/ACUvLcOZFKr+ger4GNesW/cFjfd0gncuPu44XGYrMuhw==
X-Received: by 2002:a0c:f101:0:b0:89a:6f04:ac85 with SMTP id
 6a1803df08f44-89c85a9043fmr158483166d6.54.1774280332010; Mon, 23 Mar 2026
 08:38:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202603180118.ClDWNtId-lkp@intel.com> <b859bfa1-7844-4b23-91a4-bbd526ffc19b@samba.org>
 <CAH2r5mvvjWtJza+9YrLYvneysyEQa5rENhTYiFTAwrE+KhOy8Q@mail.gmail.com>
 <CAKYAXd_yLYLD5SsRUZy8d6u7vknTPuN8Cbe11HJt0Eq6bLzBBw@mail.gmail.com> <69c54f80-dff1-4c02-af97-08799fe59b94@samba.org>
In-Reply-To: <69c54f80-dff1-4c02-af97-08799fe59b94@samba.org>
From: Steve French <smfrench@gmail.com>
Date: Mon, 23 Mar 2026 10:38:40 -0500
X-Gm-Features: AQROBzB9SG6sPgo5T8QjqxwVih72HS4tyEMWLFluaBLXGLnuGbVnDzT8w0i3o6U
Message-ID: <CAH2r5msADO+SbgJxwX0vNU0keHb5WScqOmrb+uszmG2uZt9Qrw@mail.gmail.com>
Subject: Re: [samba-ksmbd:ksmbd-for-next-next 11/12] fs/smb/server/smb2pdu.c:5723:3:
 warning: variable 'pntsd' is uninitialized when used here
To: Stefan Metzmacher <metze@samba.org>
Cc: Namjae Jeon <linkinjeon@kernel.org>, Asim Viladi Oglu Manizada <manizada@pm.me>, 
	kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Steve French <stfrench@microsoft.com>, 
	"linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I agree - looks like a bug.  Should be setting the declaration to null

   struct smb_ntsd *pntsd =3D NULL;

since the initialization of ptsd is in an if clause, you could end up
doing kfree of uninitialized pntsd pointer on line 5801

On Mon, Mar 23, 2026 at 9:52=E2=80=AFAM Stefan Metzmacher <metze@samba.org>=
 wrote:
>
> Am 23.03.26 um 15:43 schrieb Namjae Jeon:
> > On Mon, Mar 23, 2026 at 10:22=E2=80=AFPM Steve French <smfrench@gmail.c=
om> wrote:
> >>
> >> looks like a simple fix to initialize it to null at declaration, right=
?
> > It seems this test was performed on an outdated version. The current
> > ksmbd-for-next already includes the updated one, so we don't need to
> > check it.
>
> For it still happens with the current state:
>
> 1ce4e48216b84385319da308f2262eb11ee7e459
> (smfrench-smb3-kernel/ksmbd-for-next) smb: smbdirect: fix inverted compar=
ison operator in negotiation log message
>
> And there it's likely:
>
> 6a0795e46296589d8eba6c194586e9e65974d73f
> ksmbd: fix OOB write in QUERY_INFO for compound requests
>
> With setting it to NULL the smatch warning goes away.
>
> metze



--=20
Thanks,

Steve
