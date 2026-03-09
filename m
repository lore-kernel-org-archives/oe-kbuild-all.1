Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4FC1E5724
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Mar 2026 05:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773034313; cv=none; b=E4se+8mdRYENukZ1qrVveCxkQKlZ3Rtrt5qxZxNBTG0aZ8c7NqUIiqmJ8G1EN6iGK8Or3Obwv/zZfTc5UAhUnui/pwe3yPHE4cSxHn3sbSN22QUo/DkoNCPcJ5scnKZ9jrSVcM//h7KvMwkezB+qidosGjGNPvuZ69nbvOdm6VU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773034313; c=relaxed/simple;
	bh=4vfn24XF5vYM4uKJiPcBNrbK2n+o8o1NwxX6wesI5rI=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=U+AnSuk6Cyx9UHAv9ZMbntdzSsK1oV8CUFi+K1ZhCLBp3uhW4ukit4OtHfSC2nLr1Uky71MfGIj/xULb1eicKjEig+6EjZANmsANn2ncDJ6g87Qy1PWRrz40iNxcCMxNYi1aFd60aV8HdPIOmkW0ASA0iQbqLRbSzA9q2odf+mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=0OXSgQya; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="0OXSgQya"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE9DBC4CEF7;
	Mon,  9 Mar 2026 05:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1773034312;
	bh=4vfn24XF5vYM4uKJiPcBNrbK2n+o8o1NwxX6wesI5rI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=0OXSgQyaGKM4/OkMYYNOBGc1jOpQf8k6tBPMlq5b+13lMtXthcgJ/r+gE0DCCY78j
	 BlfPwEhZUvz2DdcsurS3snoWjRBKlD05ghbVxD6YZO19bitVgaTRh6xsYauJbdGTBq
	 7RoJRoO6WFEqvwezzNXMtcXSYC67tTHmeZngWErc=
Date: Sun, 8 Mar 2026 22:31:52 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>
Cc: Anthony Yznaga <anthony.yznaga@oracle.com>,
 <oe-kbuild-all@lists.linux.dev>, David Hildenbrand <david@kernel.org>,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [akpm-mm:mm-new 286/330] include/dup.h:354:25: error: stray
 '\302' in program
Message-Id: <20260308223152.7c99aaa3c73f819b7844fa07@linux-foundation.org>
In-Reply-To: <aa4QKbYOvGmDEqVG@rli9-mobl>
References: <aa4QKbYOvGmDEqVG@rli9-mobl>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, 9 Mar 2026 08:11:21 +0800 kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
> head:   167400fd4c51f9e5ea8fc9d33c89c938799be4be
> commit: 84cd8de2b92a1ccf493c43da8b31bb983d320ca7 [286/330] mm-prevent-dro=
ppable-mappings-from-being-locked-fix
> config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/2=
0260309/202603090023.npem8cfw-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260309/202603090023.npem8cfw-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/r/202603090023.npem8cfw-lkp@intel.com/
>=20
> All error/warnings (new ones prefixed by >>):
>=20
>    In file included from vma_internal.h:55,
>                     from shared.h:11,
>                     from main.c:3:
> >> include/dup.h:354:9: warning: ISO C99 requires whitespace after the ma=
cro name
>      354 | #define VM_NO_MLOCK_MASK=A0 =A0 =A0 =A0(VM_SPECIAL | VM_DROPPA=
BLE)
>          |         ^~~~~~~~~~~~~~~~

bah, OK, my attempt to turn the incoming email into something usable
didn't work out,  Let me attempt to repair that.

Anthony, text/plain changelogged, signed-off patches are very much
preferred, thanks.

