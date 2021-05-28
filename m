Content-Type: multipart/mixed; boundary="===============4816882527728927182=="
MIME-Version: 1.0
From: Stephan Müller <smueller@chronox.de>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v40 01/13] Linux Random Number Generator
Date: Fri, 28 May 2021 08:04:45 +0200
Message-ID: <2921350.VP03N2d09h@positron.chronox.de>
In-Reply-To: <202105280808.AgyBCLBL-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4816882527728927182==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Am Freitag, 28. Mai 2021, 02:41:09 CEST schrieb kernel test robot:

Hi,

> All errors (new ones prefixed by >>):
> >> drivers/char/lrng/lrng_chacha20.c:32:8: error: structure variable
> >> 'chacha20' with 'latent_entropy' attribute has a non-integer field
> >> 'block'
>       32 | struct chacha20_state chacha20 __latent_entropy;
> =

>          |        ^~~~~~~~~~~~~~

Thanks for the notification.

I think this is a false-positive discussed before. __latent_entropy is =

seemingly allowed for an entire linear buffer as seen in the declaration of =

the variable input_pool_data in driver/char/random.c which is an array of u=
32.

The struct chacha20_state is a linear buffer of u32 words. =


struct chacha20_block {
        u32 constants[4];
        union {
                u32 u[CHACHA_KEY_SIZE_WORDS];
                u8  b[CHACHA_KEY_SIZE];
        } key;
        u32 counter;
        u32 nonce[3];
};

Therefore it should be identical to the aforementioned example. The =

__latent_entropy marker therefore seems to be appropriate for this structur=
e.

Ciao
Stephan


--===============4816882527728927182==--

