Content-Type: multipart/mixed; boundary="===============2234263802553867510=="
MIME-Version: 1.0
From: Michael Ellerman <mpe@ellerman.id.au>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v4 11/16] powerpc/64s: machine check interrupt update NMI accounting
Date: Mon, 11 May 2020 19:50:06 +1000
Message-ID: <871rnqdcmp.fsf@mpe.ellerman.id.au>
In-Reply-To: <1589010505.dk8cddftjn.astroid@bobo.none>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2234263802553867510==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Nicholas Piggin <npiggin@gmail.com> writes:
> Excerpts from kbuild test robot's message of May 9, 2020 1:13 pm:
>> Hi Nicholas,
>> =

>> I love your patch! Yet something to improve:
>
> ...
>
>>   1419	#if defined(CONFIG_4xx) || defined(CONFIG_BOOKE)
>>   1420			pr_cont("DEAR: "REG" ESR: "REG" ", regs->dar, regs->dsisr);
>>   1421	#else
>>   1422			pr_cont("DAR: "REG" DSISR: %08lx ", regs->dar, regs->dsisr);
>>   1423	#endif
>>   1424	#ifdef CONFIG_PPC64
>>> 1425		pr_cont("IRQMASK: %lx IN_NMI:%d IN_MCE:%d", regs->softe, (int)get=
_paca()->in_nmi, (int)get_paca()->in_mce);
>
> Oh I meant to get rid of that hunk, it crept back in :(
>
> mpe if you could please take it out if you're merging this.

Yep. I just came here to tell you I'd dropped that hunk :)

> It was quite useful for debugging this stuff, I might do a proper patch =

> for this, but for now not necessary (it doesn't matter for "normal" =

> crashes only crash crashes).

Yeah would be good to print more of those flags.

cheers
--===============2234263802553867510==--

