Content-Type: multipart/mixed; boundary="===============1937651170285780599=="
MIME-Version: 1.0
From: Tony Lindgren <tony@atomide.com>
To: kbuild-all@lists.01.org
Subject: Re: omap-secure.c:undefined reference to `__arm_smccc_smc'
Date: Fri, 21 Feb 2020 09:26:31 -0800
Message-ID: <20200221172631.GY37466@atomide.com>
In-Reply-To: <333dd36f-e760-64b3-9e0f-3a316df9ad10@ti.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1937651170285780599==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

* Andrew F. Davis <afd@ti.com> [200220 10:23]:
> On 2/20/20 1:11 PM, Tony Lindgren wrote:
> > * Tony Lindgren <tony@atomide.com> [200220 17:58]:
> >> * Andrew F. Davis <afd@ti.com> [200220 17:39]:
> >>> If the machine has SMCCC then it will also have the
> >>> CONFIG_HAVE_ARM_SMCCC set and so nothing would change.
> >>
> >> Hmm yeah good point.
> > =

> > So the patch below seems like the way to go then. Anybody have issues
> > with the patch below?
> > =

> > Regards,
> > =

> > Tony
> > =

> > 8< -------------------------
> > diff --git a/include/linux/arm-smccc.h b/include/linux/arm-smccc.h
> > --- a/include/linux/arm-smccc.h
> > +++ b/include/linux/arm-smccc.h
> > @@ -121,6 +121,7 @@ struct arm_smccc_quirk {
> >  	} state;
> >  };
> >  =

> > +#ifdef CONFIG_HAVE_ARM_SMCCC
> >  /**
> >   * __arm_smccc_smc() - make SMC calls
> >   * @a0-a7: arguments passed in registers 0 to 7
> > @@ -137,6 +138,14 @@ asmlinkage void __arm_smccc_smc(unsigned long a0, =
unsigned long a1,
> >  			unsigned long a2, unsigned long a3, unsigned long a4,
> >  			unsigned long a5, unsigned long a6, unsigned long a7,
> >  			struct arm_smccc_res *res, struct arm_smccc_quirk *quirk);
> > +#else
> > +static inline void __arm_smccc_smc(unsigned long a0, unsigned long a1,
> > +			unsigned long a2, unsigned long a3, unsigned long a4,
> > +			unsigned long a5, unsigned long a6, unsigned long a7,
> > +			struct arm_smccc_res *res, struct arm_smccc_quirk *quirk)
> > +{
> =

> =

> Maybe a warning? If you do not have SMC on your platform but are still
> making SMC calls then something is broken and it looks like it would
> fail silently here.

OK I'll add that and send out a  proper patch.

Thanks,

Tony
--===============1937651170285780599==--

