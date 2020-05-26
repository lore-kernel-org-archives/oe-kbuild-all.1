Content-Type: multipart/mixed; boundary="===============7696371027787643843=="
MIME-Version: 1.0
From: Nick Desaulniers <ndesaulniers@google.com>
To: kbuild-all@lists.01.org
Subject: Re: [EXT] [linux-next:master 6663/12912] drivers/net/dsa/sja1105/sja1105_static_config.c:463:8: warning: no previous prototype for function 'sja1105_vl_lookup_entry_packing'
Date: Tue, 26 May 2020 14:49:55 -0700
Message-ID: <CAKwvOdnvfQXvSiBQjYdL3ASeB1WEoj-zJGURV1N+DNDZTAnh3Q@mail.gmail.com>
In-Reply-To: <VI1PR04MB5696923A89D612E7EB299DA7E0B00@VI1PR04MB5696.eurprd04.prod.outlook.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7696371027787643843==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, May 26, 2020 at 2:48 PM Vladimir Oltean <vladimir.oltean@nxp.com>=
 wrote:
>
> Hi Nick,
>
> On 5/27/20 12:07 AM, Nick Desaulniers wrote:
> > Caution: EXT Email
> >
> > On Tue, May 26, 2020 at 12:40 PM Vladimir Oltean
> > <vladimir.oltean@nxp.com> wrote:
> >>
> >> What's wrong with a function that has no previous prototype?
> >
> > It's possible that functions definitions don't match their
> > declarations, which would be an ABI mismatch.
> >
> >> What 'fix' would be recommended?
> >
> > Including the correct header that declares the function.
> >
>
> Thanks for the reply. I have no intention whatsoever in making any
> changes to the code structure. There's a big difference between the
> possibility of being an ABI mismatch and actually being one.

May all your warnings be free of bugs.  Note: this warning was from a
`make W=3D1` build.
-- =

Thanks,
~Nick Desaulniers
--===============7696371027787643843==--

