Content-Type: multipart/mixed; boundary="===============6788274327555454294=="
MIME-Version: 1.0
From: Joe Perches <joe@perches.com>
To: kbuild-all@lists.01.org
Subject: Re: [RFC PATCH] staging: rtl8192u: indicate_packets() can be static
Date: Sun, 17 May 2020 13:49:50 -0700
Message-ID: <ec2fa70939ab20dc7c454897b0b8ed08570dca80.camel@perches.com>
In-Reply-To: <20200517202216.GA24634@8c544063f25c>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6788274327555454294==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, 2020-05-18 at 04:22 +0800, kbuild test robot wrote:
> Signed-off-by: kbuild test robot <lkp@intel.com>
> ---

This doesn't apply on Linus' tree or -next so perhaps the
robot should put what tree and branch patches like these
are meant to be applied on after the --- line

>  ieee80211_rx.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> =

> diff --git a/drivers/staging/rtl8192u/ieee80211/ieee80211_rx.c b/drivers/=
staging/rtl8192u/ieee80211/ieee80211_rx.c
> index 3309f64be4c94..bceff1ba3d7d4 100644
> --- a/drivers/staging/rtl8192u/ieee80211/ieee80211_rx.c
> +++ b/drivers/staging/rtl8192u/ieee80211/ieee80211_rx.c
> @@ -520,7 +520,7 @@ static bool AddReorderEntry(struct rx_ts_record *pTS,=
 struct rx_reorder_entry *p
>  	return true;
>  }
>  =

> -void indicate_packets(struct ieee80211_device *ieee, struct ieee80211_rx=
b *rxb)
> +static void indicate_packets(struct ieee80211_device *ieee, struct ieee8=
0211_rxb *rxb)
>  {
>  	struct net_device_stats *stats =3D &ieee->stats;
>  	struct net_device *dev =3D ieee->dev;

--===============6788274327555454294==--

