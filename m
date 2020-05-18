Content-Type: multipart/mixed; boundary="===============7324508408257416845=="
MIME-Version: 1.0
From: Viresh Kumar <viresh.kumar@linaro.org>
To: kbuild-all@lists.01.org
Subject: Re: [kbuild] [vireshk-pm:opp/linux-next 4/11] drivers/opp/of.c:662:7-14: ERROR: reference preceded by free on line 625
Date: Mon, 18 May 2020 11:57:51 +0530
Message-ID: <20200518062751.qcezuswcjwk4n53s@vireshk-i7>
In-Reply-To: <20200515115841.GK3041@kadam>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7324508408257416845==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 15-05-20, 14:58, Dan Carpenter wrote:
> 0f438abc246a03 drivers/opp/of.c            Georgi Djakov   2020-05-12  63=
5  		}
> 0f438abc246a03 drivers/opp/of.c            Georgi Djakov   2020-05-12  63=
6  =

> 0f438abc246a03 drivers/opp/of.c            Georgi Djakov   2020-05-12  63=
7  		ret =3D of_property_read_u32_array(np, "opp-avg-kBps", avg_bw,
> 0f438abc246a03 drivers/opp/of.c            Georgi Djakov   2020-05-12  63=
8  						 count);
> =

> This code is really confusing.  This assignment over writes the "ret"
> variable.  I guess that's intended instead of using "found =3D true;" on
> this path???
> =

> It really feels like this function should be split into multiple
> functions.  If I read it correctly, then if it can find any property
> then that's counted as a success?  I guess we'd like to find them all
> but if we can find one then that's enough?

I have made necessary changes to the routine now. Thanks.

-- =

viresh
--===============7324508408257416845==--

