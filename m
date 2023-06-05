Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C76DDC0
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Jun 2023 20:07:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 10B7363CC10C;
	Mon,  5 Jun 2023 22:07:31 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id X6roPuzR374K; Mon,  5 Jun 2023 22:07:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id BF45E6081100;
	Mon,  5 Jun 2023 22:07:30 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id xJjb7zySq9_X; Mon,  5 Jun 2023 22:07:30 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 9FE3863CC10C;
	Mon,  5 Jun 2023 22:07:30 +0200 (CEST)
Date: Mon, 5 Jun 2023 22:07:30 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Azeem Shaikh <azeemshaikh38@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Kees Cook <kees@kernel.org>, 
	kernel test robot <lkp@intel.com>, 
	Maxim Krasnyansky <maxk@qti.qualcomm.com>, 
	oe-kbuild-all <oe-kbuild-all@lists.linux.dev>, 
	linux-hardening <linux-hardening@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	anton ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, 
	linux-um <linux-um@lists.infradead.org>
Message-ID: <458187791.3685910.1685995650602.JavaMail.zimbra@nod.at>
In-Reply-To: <CADmuW3WXDg-5SFXkMDE6BmvSwLNHmXpTzBonaOL8eErc4+d3qQ@mail.gmail.com>
References: <20230530164004.986750-1-azeemshaikh38@gmail.com> <202305311135.zGMT1gYR-lkp@intel.com> <09A0C6FA-669F-4B73-9620-43AEA17E5D0C@kernel.org> <103925562.158061.1685514200368.JavaMail.zimbra@nod.at> <CAMuHMdU70uRxnMNb8KCJe8M3BRPPxowRXtj+POcrh+KLkfQyAA@mail.gmail.com> <CADmuW3WXDg-5SFXkMDE6BmvSwLNHmXpTzBonaOL8eErc4+d3qQ@mail.gmail.com>
Subject: Re: [PATCH] uml: Replace all non-returning strlcpy with strscpy
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: Replace all non-returning strlcpy with strscpy
Thread-Index: F0kvDMRUOo3WCvHaQMtuD24L4U1LkA==

----- Urspr=C3=BCngliche Mail -----
> Von: "Azeem Shaikh" <azeemshaikh38@gmail.com>
> Planning to send out v2 with the fixup from Richard applied. Let me
> know if that's ok.

Fine by me. :-)

Thanks,
//richard
