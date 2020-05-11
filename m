Content-Type: multipart/mixed; boundary="===============6549949108795464377=="
MIME-Version: 1.0
From: Kalle Valo <kvalo@codeaurora.org>
To: kbuild-all@lists.01.org
Subject: Re: [ath6kl:pending 90/99] drivers/net/wireless/ath/ath11k/debug_htt_stats.c:4613:2-8: preceding lock on line 4604 (fwd)
Date: Mon, 11 May 2020 14:36:53 +0300
Message-ID: <87d07a66ui.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <alpine.DEB.2.21.2005072001560.2505@hadrien>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6549949108795464377==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

(moving to ath11k list)

Julia Lawall <julia.lawall@inria.fr> writes:

> Hello,
>
> An unlock may be missing on line 4613.
>
> julia
>
> ---------- Forwarded message ----------
> Date: Thu, 7 May 2020 20:37:55 +0800
> From: kbuild test robot <lkp@intel.com>
> To: kbuild(a)lists.01.org
> Cc: lkp(a)intel.com, Julia Lawall <julia.lawall@lip6.fr>
> Subject: [ath6kl:pending 90/99]
>     drivers/net/wireless/ath/ath11k/debug_htt_stats.c:4613:2-8: preceding=
 lock
>     on line 4604
>
> CC: kbuild-all(a)lists.01.org
> CC: Kalle Valo <kvalo@codeaurora.org>
> CC: ath10k(a)lists.infradead.org
> TO: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
> CC: Kalle Valo <kvalo@codeaurora.org>
> CC: Miles Hu <milehu@codeaurora.org>
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pen=
ding
> head:   d9e109721e24a6923a36ec88710086c3c23d3429
> commit: a803b0a31d641cde3f7f2e68541ec318349b27a2 [90/99] ath11k: fix
> htt stats module not handle multiple skbs
> :::::: branch date: 7 hours ago
> :::::: commit date: 7 hours ago
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
> Reported-by: Julia Lawall <julia.lawall@lip6.fr>
>
>
> coccinelle warnings: (new ones prefixed by >>)
>
>>> drivers/net/wireless/ath/ath11k/debug_htt_stats.c:4613:2-8:
> preceding lock on line 4604

Indeed, I reported that to the author and dropped the patch from my
pending branch:

https://patchwork.kernel.org/patch/11529687/

Thanks for the report.

-- =

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatc=
hes
--===============6549949108795464377==--

