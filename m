Content-Type: multipart/mixed; boundary="===============1282375453479155675=="
MIME-Version: 1.0
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: kbuild-all@lists.01.org
Subject: Re: [EXT] [linux-next:master 6663/12912] drivers/net/dsa/sja1105/sja1105_static_config.c:463:8: warning: no previous prototype for function 'sja1105_vl_lookup_entry_packing'
Date: Tue, 26 May 2020 21:54:13 +0000
Message-ID: <
 <VI1PR04MB5696D5102C398E4858713CA1E0B00@VI1PR04MB5696.eurprd04.prod.outlook.com>>
In-Reply-To: <CAKwvOdnvfQXvSiBQjYdL3ASeB1WEoj-zJGURV1N+DNDZTAnh3Q@mail.gmail.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1282375453479155675==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 5/27/20 12:50 AM, Nick Desaulniers wrote:
> Caution: EXT Email
> =

> On Tue, May 26, 2020 at 2:48 PM Vladimir Oltean <vladimir.oltean@nxp.co=
m> wrote:
>>
>> Hi Nick,
>>
>> On 5/27/20 12:07 AM, Nick Desaulniers wrote:
>>> Caution: EXT Email
>>>
>>> On Tue, May 26, 2020 at 12:40 PM Vladimir Oltean
>>> <vladimir.oltean@nxp.com> wrote:
>>>>
>>>> What's wrong with a function that has no previous prototype?
>>>
>>> It's possible that functions definitions don't match their
>>> declarations, which would be an ABI mismatch.
>>>
>>>> What 'fix' would be recommended?
>>>
>>> Including the correct header that declares the function.
>>>
>>
>> Thanks for the reply. I have no intention whatsoever in making any
>> changes to the code structure. There's a big difference between the
>> possibility of being an ABI mismatch and actually being one.
> =

> May all your warnings be free of bugs.  Note: this warning was from a
> `make W=3D1` build.
> --
> Thanks,
> ~Nick Desaulniers
> =


That's not the wish I was hoping for, but rather 'may all your warnings =

be relevant'.

Cheers,
-Vladimir

--===============1282375453479155675==--

