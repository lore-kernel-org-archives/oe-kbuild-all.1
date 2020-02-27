Content-Type: multipart/mixed; boundary="===============7642742402541663624=="
MIME-Version: 1.0
From: Nicolas Boichat <drinkcat@chromium.org>
To: kbuild-all@lists.01.org
Subject: Re: [RFC PATCH drm-drm-misc] drm/panfrost: default_supplies[] can be static
Date: Thu, 27 Feb 2020 10:57:41 +0800
Message-ID: <CANMq1KAF0pc4egx_nBikWCp77KthkDwz_agwfwHwwdd_RR7jeQ@mail.gmail.com>
In-Reply-To: <20200227014100.GA61938@e50d7db646c3>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7642742402541663624==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 27, 2020 at 9:42 AM kbuild test robot <lkp@intel.com> wrote:
>
>
> Fixes: 3e1399bccf51 ("drm/panfrost: Add support for multiple regulators")
> Signed-off-by: kbuild test robot <lkp@intel.com>

Looks right, sorry about that. Thanks!

Reviewed-by: Nicolas Boichat <drinkcat@chromium.org>

> ---
>  panfrost_drv.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/pa=
nfrost/panfrost_drv.c
> index 4d08507526239..3e521627b5fbb 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -659,7 +659,7 @@ static int panfrost_remove(struct platform_device *pd=
ev)
>         return 0;
>  }
>
> -const char * const default_supplies[] =3D { "mali" };
> +static const char * const default_supplies[] =3D { "mali" };
>  static const struct panfrost_compatible default_data =3D {
>         .num_supplies =3D ARRAY_SIZE(default_supplies),
>         .supply_names =3D default_supplies,
--===============7642742402541663624==--

