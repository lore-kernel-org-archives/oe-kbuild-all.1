Content-Type: multipart/mixed; boundary="===============6824671114972483524=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v7 3/9] media: imx-jpeg: Add V4L2 driver for i.MX8 JPEG Encoder/Decoder
Date: Wed, 20 Jan 2021 19:07:08 +0800
Message-ID: <202101201954.4bCk712q-lkp@intel.com>
In-Reply-To: <20210111192822.12178-4-mirela.rabulea@oss.nxp.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6824671114972483524==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Mirela,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linuxtv-media/master]
[also build test WARNING on shawnguo/for-next robh/for-next linus/master v5=
.11-rc4 next-20210120]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Mirela-Rabulea/Add-V4L2-dr=
iver-for-i-MX8-JPEG-Encoder-Decoder/20210112-033507
base:   git://linuxtv.org/media_tree.git master
config: i386-randconfig-m021-20210120 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

smatch warnings:
drivers/media/platform/imx-jpeg/mxc-jpeg.c:1373 mxc_jpeg_parse() warn: inco=
nsistent indenting

vim +1373 drivers/media/platform/imx-jpeg/mxc-jpeg.c

  1286	=

  1287	static int mxc_jpeg_parse(struct mxc_jpeg_ctx *ctx,
  1288				  u8 *src_addr, u32 size, bool *dht_needed)
  1289	{
  1290		struct device *dev =3D ctx->mxc_jpeg->dev;
  1291		struct mxc_jpeg_q_data *q_data_out, *q_data_cap;
  1292		enum v4l2_buf_type cap_type =3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
  1293		struct mxc_jpeg_stream stream;
  1294		bool notfound =3D true;
  1295		bool app14 =3D false;
  1296		bool src_chg =3D false;
  1297		u8 app14_transform =3D 0;
  1298		struct mxc_jpeg_sof sof, *psof =3D NULL;
  1299		struct mxc_jpeg_sos *psos =3D NULL;
  1300		int byte;
  1301		u8 *next =3D NULL;
  1302		enum mxc_jpeg_image_format img_fmt;
  1303		u32 fourcc;
  1304	=

  1305		memset(&sof, 0, sizeof(struct mxc_jpeg_sof));
  1306		stream.addr =3D src_addr;
  1307		stream.end =3D size;
  1308		stream.loc =3D 0;
  1309		*dht_needed =3D true;
  1310	=

  1311		/* check stream starts with SOI */
  1312		byte =3D get_byte(&stream);
  1313		if (byte =3D=3D -1 || byte !=3D 0xFF)
  1314			return -EINVAL;
  1315		byte =3D get_byte(&stream);
  1316		if (byte =3D=3D -1 || byte !=3D 0xD8)
  1317			return -EINVAL;
  1318	=

  1319		while (notfound) {
  1320			byte =3D get_byte(&stream);
  1321			if (byte =3D=3D -1)
  1322				return -EINVAL;
  1323			if (byte !=3D 0xff)
  1324				continue;
  1325			do {
  1326				byte =3D get_byte(&stream);
  1327			} while (byte =3D=3D 0xff);
  1328			if (byte =3D=3D -1)
  1329				return false;
  1330			if (byte =3D=3D 0)
  1331				continue;
  1332			switch (byte) {
  1333			case DHT:
  1334				/* DHT marker present, no need to inject default one */
  1335				*dht_needed =3D false;
  1336				break;
  1337			case SOF2: /* Progressive DCF frame definition */
  1338				dev_err(dev,
  1339					"Progressive JPEG not supported by hardware");
  1340				return -EINVAL;
  1341			case SOF1: /* Extended sequential DCF frame definition */
  1342			case SOF0: /* Baseline sequential DCF frame definition */
  1343				if (get_sof(dev, &stream, &sof) =3D=3D -1)
  1344					break;
  1345				next =3D stream.addr + stream.loc;
  1346				psof =3D (struct mxc_jpeg_sof *)next;
  1347				break;
  1348			case SOS:
  1349				next =3D stream.addr + stream.loc;
  1350				psos =3D (struct mxc_jpeg_sos *)next;
  1351				notfound =3D false;
  1352				break;
  1353			case APP14:
  1354				app14 =3D true;
  1355				/*
  1356				 * Application Data Syntax is:
  1357				 * 2 bytes(APPn:0xFF,0xEE), 2 bytes(Lp), Ap1...ApLp-2
  1358				 * The transform flag is in Ap12
  1359				 * stream.loc is now on APPn-0xEE byte
  1360				 */
  1361				app14_transform =3D *(stream.addr + stream.loc + 12 + 1);
  1362				break;
  1363			default:
  1364				notfound =3D true;
  1365			}
  1366		}
  1367		q_data_out =3D mxc_jpeg_get_q_data(ctx,
  1368						 V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
  1369		if (q_data_out->w =3D=3D 0 && q_data_out->h =3D=3D 0) {
  1370			dev_warn(dev, "Invalid user resolution 0x0");
  1371			dev_warn(dev, "Keeping resolution from JPEG: %dx%d",
  1372				 sof.width, sof.height);
> 1373			 q_data_out->w =3D sof.width;
  1374			 q_data_out->h =3D sof.height;
  1375		} else if (sof.width !=3D q_data_out->w || sof.height !=3D q_data_o=
ut->h) {
  1376			dev_err(dev,
  1377				"Resolution mismatch: %dx%d (JPEG) versus %dx%d(user)",
  1378				sof.width, sof.height, q_data_out->w, q_data_out->h);
  1379			return -EINVAL;
  1380		}
  1381		if (sof.width % 8 !=3D 0 || sof.height % 8 !=3D 0) {
  1382			dev_err(dev, "JPEG width or height not multiple of 8: %dx%d\n",
  1383				sof.width, sof.height);
  1384			return -EINVAL;
  1385		}
  1386		if (sof.width > MXC_JPEG_MAX_WIDTH ||
  1387		    sof.height > MXC_JPEG_MAX_HEIGHT) {
  1388			dev_err(dev, "JPEG width or height should be <=3D 8192: %dx%d\n",
  1389				sof.width, sof.height);
  1390			return -EINVAL;
  1391		}
  1392		if (sof.width < MXC_JPEG_MIN_WIDTH ||
  1393		    sof.height < MXC_JPEG_MIN_HEIGHT) {
  1394			dev_err(dev, "JPEG width or height should be > 64: %dx%d\n",
  1395				sof.width, sof.height);
  1396			return -EINVAL;
  1397		}
  1398		if (sof.components_no > MXC_JPEG_MAX_COMPONENTS) {
  1399			dev_err(dev, "JPEG number of components should be <=3D%d",
  1400				MXC_JPEG_MAX_COMPONENTS);
  1401			return -EINVAL;
  1402		}
  1403		/* check and, if necessary, patch component IDs*/
  1404		if (!mxc_jpeg_valid_comp_id(dev, psof, psos))
  1405			dev_warn(dev, "JPEG component ids should be 0-3 or 1-4");
  1406	=

  1407		img_fmt =3D mxc_jpeg_get_image_format(dev, &sof);
  1408		if (img_fmt =3D=3D MXC_JPEG_INVALID)
  1409			return -EINVAL;
  1410	=

  1411		/*
  1412		 * If the transform flag from APP14 marker is 0, images that are
  1413		 * encoded with 3 components have RGB colorspace, see Recommendation
  1414		 * ITU-T T.872 chapter 6.5.3 APP14 marker segment for colour encodi=
ng
  1415		 */
  1416		if (img_fmt =3D=3D MXC_JPEG_YUV444 && app14 && app14_transform =3D=
=3D 0)
  1417			img_fmt =3D MXC_JPEG_RGB;
  1418	=

  1419		if (mxc_jpeg_imgfmt_to_fourcc(img_fmt, &fourcc)) {
  1420			dev_err(dev, "Fourcc not found for %d", img_fmt);
  1421			return -EINVAL;
  1422		}
  1423	=

  1424		/*
  1425		 * set-up the capture queue with the pixelformat and resolution
  1426		 * detected from the jpeg output stream
  1427		 */
  1428		q_data_cap =3D mxc_jpeg_get_q_data(ctx, cap_type);
  1429		if (q_data_cap->w !=3D sof.width || q_data_cap->h !=3D sof.height)
  1430			src_chg =3D true;
  1431		q_data_cap->w =3D sof.width;
  1432		q_data_cap->h =3D sof.height;
  1433		q_data_cap->fmt =3D mxc_jpeg_find_format(ctx, fourcc);
  1434		q_data_cap->w_adjusted =3D q_data_cap->w;
  1435		q_data_cap->h_adjusted =3D q_data_cap->h;
  1436		/*
  1437		 * align up the resolution for CAST IP,
  1438		 * but leave the buffer resolution unchanged
  1439		 */
  1440		v4l_bound_align_image(&q_data_cap->w_adjusted,
  1441				      q_data_cap->w_adjusted,  /* adjust up */
  1442				      MXC_JPEG_MAX_WIDTH,
  1443				      q_data_cap->fmt->h_align,
  1444				      &q_data_cap->h_adjusted,
  1445				      q_data_cap->h_adjusted, /* adjust up */
  1446				      MXC_JPEG_MAX_HEIGHT,
  1447				      q_data_cap->fmt->v_align,
  1448				      0);
  1449		dev_dbg(dev, "Detected jpeg res=3D(%dx%d)->(%dx%d), pixfmt=3D%c%c%c=
%c\n",
  1450			q_data_cap->w, q_data_cap->h,
  1451			q_data_cap->w_adjusted, q_data_cap->h_adjusted,
  1452			(fourcc & 0xff),
  1453			(fourcc >>  8) & 0xff,
  1454			(fourcc >> 16) & 0xff,
  1455			(fourcc >> 24) & 0xff);
  1456	=

  1457		/* setup bytesperline/sizeimage for capture queue */
  1458		mxc_jpeg_bytesperline(q_data_cap, sof.precision);
  1459		mxc_jpeg_sizeimage(q_data_cap);
  1460	=

  1461		/*
  1462		 * if the CAPTURE format was updated with new values, regardless of
  1463		 * whether they match the values set by the client or not, signal
  1464		 * a source change event
  1465		 */
  1466		if (src_chg)
  1467			notify_src_chg(ctx);
  1468	=

  1469		return 0;
  1470	}
  1471	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============6824671114972483524==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

H4sICOsECGAAAy5jb25maWcAjFxLd9w2st7nV/RxNskiGT1sxTn3aIEmQTbSJMEAZKulDY8itxOd
2FJGj0n8729VgQ8ALLYzi4yFKjwI1OOrQqG//ebblXh9efx8+3J/d/vp05fV74eHw9Pty+HD6uP9
p8P/rVK9qnSzkqlqfgTm4v7h9Z//3J+/v1i9+/H09MeTH57uTlfbw9PD4dMqeXz4eP/7K3S/f3z4
5ttvEl1lKu+SpNtJY5Wuukbum8s3v9/d/fDz6rv08Nv97cPq5x/PYZjTd9+7f73xuinb5Uly+WVo
yqehLn8+OT85GQhFOrafnb87of+N4xSiykfy1MXrc+LNuRG2E7bsct3oaWaPoKpCVXIiKfNrd6XN
dmpZt6pIG1XKrhHrQnZWm2aiNhsjRQrDZBr+AywWu8J2fbvKafM/rZ4PL69/TRuoKtV0stp1wsC6
Vamay/MzYB/WpstawTSNtM3q/nn18PiCI4wfqhNRDF/65g3X3InW/1haf2dF0Xj8G7GT3VaaShZd
fqPqid2nrIFyxpOKm1LwlP3NUg+9RHjLE25skwJl3Bpvvf7OxHRa9TEGXPsx+v6G2fjgK+Yjvj02
IH4IM2QqM9EWDUmEdzZD80bbphKlvHzz3cPjw+H7kcFe252qPU3qG/D/k6aY2mtt1b4rf21lK/nW
qcu45ivRJJuOqMyaE6Ot7UpZanPdiaYRyWYaubWyUGt/MNGCqWGGoWMWBiYiDlyFKIpBc0AJV8+v
vz1/eX45fJ40J5eVNCohHa2NXnvf5JPsRl/xFJllMmkUTp1lXel0NeKrZZWqigwBP0ipciMaVD9P
aE0KJNvZq85ICyPwXZONr2nYkupSqCpss6rkmLqNkga37HphXaIxcK6wjWALGm14Llye2dH6u1Kn
keXLtElk2hs12AVPxGphrOx3ZTxef+RUrts8s6EeHB4+rB4/Rgc62XKdbK1uYU4ndan2ZiTp8FlI
Tb5wnXeiUKloZFcI23TJdVIwokEmfDdJWkSm8eROVo09SuzWRos0gYmOs5VwYiL9pWX5Sm27tsYl
R5bP6WZSt7RcY8mhDA6JdKO5/3x4eubUo1HJttOVBPn35qx0t7lBr1KSxI5HB401LEanKmH00/VS
qb+R1OatV+UbFKd+pTR2f9yzNU7T1kbKsm5gsEqyJnNg2OmirRphrpnV9TyeSes7JRr6zJqdrtLu
wc7+p7l9/nP1Aktc3cJyn19uX55Xt3d3j68PL/cPv0f7iUchEho30AeUeJIojkhHaZMNqJLY5bHS
rG2K5iuRYEihd8NuA567bURjuc+3yvtGq0aPkSqLECX1z+JffLEHPuBrldUF2Qd/Zto8k7Qry8gd
7HIHtPlxuMZxdPizk3uQOs4j2GAEGjNqwh2hMXo1YkizpjaVXHtjRBIRcGDY8KKYdMWjVBLO0so8
WReKNHrc33BTRvHYun94ArMdN0cnfvMGTK3TnxHLIWjLwI+prLk8O/Hb8YBKsffop2fTrquq2QLS
y2Q0xul5IJltZXsoSyJKVmtQEHv3x+HD66fD0+rj4fbl9enw7PSmd/AAv8uaNpG180zvwJxfiarp
1mjqYd62KgWMVay7rGitByOS3Oi2tr7oAOBIcg6OEKv7kGmATCjThZRJxDMw4aJKr1TabJgRTbPY
07XXKuWUsqealHBx3CkDeb6RhlV1OFMrWUXvO6dypxIZ7w/2Q/MxawcFy5glkH/mFE+jmet5RBOs
HuEneH4wVfzKNzLZ1hrEDh0BYA4OMfZ2EGISmsMfHpwxnEYqwV4AZJEcRjayEB7gWRdb3A7CAsY7
cfpblDCagwQenDZpFOFAQxTYQEsYz0ADhTGT6UIOzW4CkXj4D6QF6L/WGr1VaCIgLNXgrUp1IxGJ
0UFqU4qKDn/a9YjNwj+4SDHttKk3ogKtM545i4MEZxJUenoR84CxTiS5T2cwY6yS2HoLqwRvgcv0
DqnOpj+cwfdihHCmEvyWAvn34KrNZYPYvJuwWiQxPYH56Ay+14GWCVAQpHIghcUSaDV930VWtCo9
HwuKE4wYfjh79GsBaDlr+UW2jdx71gr/BLPi7VmtfYhqVV6JIvPEnb4mC6wTwc6MkzW7AesZBGWK
l2Sluxa+njMSIt0pK4eN95wVDL0Wxij/ALfIcl3aeUsXQO+xlTYLNR1jswAq1Rl32JM/AsEh6MN+
OLkcTPRMi4TRKsDfYKk8ZbcywGdkKKmVGRNGkmnqOxunC7COLo4eqBGW2O1KispCGTo9eTtDWH3q
rT48fXx8+nz7cHdYyf8dHgCuCXCwCQI2ANYT9GKndetnJ+/d9L+cZlrtrnSzOIDNK5It2rWb27No
uqwFeHwKXyYlLsR6YYCQTfNsYg0nanI54F5PU5CGvhZRWmfAFugynnmiY9gOUJLXmTbLACHVAqbx
Q2pvKPhchGMQGDdK8PIJWC9TBa9SZFLJeQaxU5g1HJj37y+6c89jUaDepdfgoCGezCLzDNy+a7SN
aRMy46lMIOb3VFW3Td02HbmZ5vLN4dPH87MfMCHsZxa34KE729Z1kPkEDJlsHZCe0crSQ9akhiVi
PVOB61UuOL58f4wu9penFzzDIFNfGSdgC4YbkxZWdKnv9QdCIMJuVHE9+LwuS5N5F7BQam0wBZGG
gGW0QSgqaOL2HE0ARuowEU3OnOEAKQK16+ocJKqJbA+AR4f6XLBqpPdJFLcMJLJdMJTBJMmmrbYL
fCT0LJtbj1pLU7kUEjhXq9ZFvGTbWsyjLZEpDKCtE0W3acHfF+tAekHWO1vWs1FJzDB1gtk/z+Rl
4OGlMMV1gmkt6WGROnehTgH2C/zWGAj1VwBW4J6jJOPGysQpOdni+unx7vD8/Pi0evnyl4ucuZDo
RsMIaZhQHjTE/wL8qkyKpjXSwWrfmCCxrCnFxtqRXBdppiwbr8gG0EJwh4GjOXEDFGeKeKK1ymFl
zFBIlPsGDg6FYYJ1QW9uKQEDGDTMiNeWjxmQRZTT+H10swBIbNaVa7U4kEmT87PT/cK3gBBVIA9w
vFUqTICWoO1sf3q63FEZZS8/ex0oitGlAmMJgQZm6vBDDTPC5hoUCeASQPO8lX7+Dw5Y7JRpAiDQ
t83jszmLrVVFac+FdW92aIiKNYhztxuEedowWTH9tuDbo2W6zGvdYvoPtKRoejg6LWjHH/+40Cgz
xsHugXXIPkyh/tv3F3bPjo8knvDuCKGxySKtLBdmulgaEOwaBCyl4oVyIh+n80HDQOWjyXK7sKTt
Twvt75mNLxPTWh2g7FJmGahgmPGbqFeqwouLZGH2nnye8mRweQvj5hKwSL4/PULtioXjSa6N2i9u
8k6J5Lzj7wCJuLBhGBcs9AL4Vy5o3SwdOVhBU+EnOOfuEnEXPktxukxzRhTDm0TX1+HQIM+RrS/r
fbLJL97GzXoXtgBcUmVbknPIADkW1+GsZIIg8C+tBxGVAHOInqsL0gbIvyv3M582IV9McGN6QhYy
yFLB5ODJ3SfOm+lkA6w7UMBrBGmQvnlznS9I7jgkaJVoF5NvxANAtrKlbARMfZSxLZOvsdxshN4r
zthuaumMo7e/1CbLtkD0aJogSkxLxYxSEUyzGN8AUFvLHFDwGU/Eq8j3MWkIm2LC1OC8nS0DT+Ua
S+66iMQZSxA6Uc80QTONRhoIPVz+am30VlYuJYa3qDNgFKIDB8680PXz48P9y+NTcHfjBcaDLlVh
1D/nMKIujtETvI8JU0seD2EafRXnePuobmG9wf7JXCTXoFN+8Bb+hWynF2v/GpQwm60BAJPKhEhM
1wX+RxrOdDUa7M5aAMgZFP39Nh7BSDwVGLyteTQH0ScoOpi5BaFwliQYk4AFO1il8U4R4DtL7Wlv
OTTR0y7e5v7W2boAuHYe5O6G1jMeag3kUx6zgEbpLIOA6/Lkn+QkrEzq1xAeTS1muFwg+GyUbVTi
2UvCXBnYABgCtFYwMRWFB8tkMrNDZQZe7XvCrAqUrmIArXhh3srLk3Bz64ZH4bRszPRD5KAtJs9M
W8cXhIHQYIkB3kFdXV689WSlMRxcptWPqRpvHAuhfCw8gKyWIhenpI3d08fjOc30IeLgvQbDiZcX
LK/MeASyuelOT06WSGfvTjgZvunOT078NbtReN5Lr17OGeaNwQtrL7sq9zJwJokRdtOlLRv71Ztr
q9CAg3AaFO/TXrqnywxJWTAUvWP9RaHyCvqfhcqhm7poyUUG+V2wLhgJlD4D98Eup+kzzZKMu9QG
pVlJmVJGBebgkvBwsCq77oq0Ce4ZBnt9JPgPBNfp4qB2/QIj1ex5nGWp0U80/pVr/fj34WkFvuH2
98Pnw8MLzSaSWq0e/8LayyDd0GdW+PCLM/MITvOZQQjzKTiZR5v9NfgmOnwLiq23bZycKcGCNH1d
F3ap/TQZtcA2N2C9yEmSDYShpszhdDuBvHTeORteu7HqxLjlRJMYuev0ThqjUumnn8LhZcKVK/kc
Il79WjRgOa/j1rZpwroaat7B7Hpp6EzMO6QgD0v8hNaN/LWrrY2mn1D2CE54cljJExJni1E1CzuJ
tqDI0XQizw2ITKMXD7DZACoRsURSVS6RSWPaOjcijRce0xjJYdXDrTFReLHAVaC4zdYQK4DZMNGk
w3cr3YPZcFi75vGR6yt5fXUTthZCSzAgzUYfYTMybbE0D+8sroRB71VwpVGTAopaemoctvfXm+EU
SFheQFo32ZGvoH/H1X+jXVJ4ZQ0SsQwa6jKOi2ymLqeqrVX2dPjv6+Hh7svq+e72UwD2BwUJQ0ZS
mVzvsEoVo9BmgRyX+4xE1Kg44CTCUG6Fvb07eq6Ag+2CBtCK8KaT5cT4n8ovFsPNWRfCAm2jOJcX
fHZYXMByHF3n4vo4Rl2lEqZK/YxqdAhVX5e6++pg4yf64vExFo/Vh6f7/wWXpcDmtquZYp6pjRLS
qYwyJg4I1rPIj0Q2SYb+y5nu3oAfZaKNrvRVFyb4WI6fprVHhMFvh9n6PSGGcsG0EMyupUzBM7s8
iVEV57hCRpVs/JMMibZcztfXb12+N1pPGB3SgVR0wzkLaQtd5aZdBu5I34AyLDLISawD30SC9PzH
7dPhgwe72A/EEvfPPIku+LCkTtQuZPIxJW/FRglWHz4dQpumokqWoY20oBBpyuKjgKuUVbs4RCP5
qCZgGvL/rK9xpOGuIP5Y+iLvNod0CRn5FMlXYTBt1fr1eWhYfQfefHV4ufvxex8io4vPNcaqvDci
clm6P4+wpMrIhAMKjiwqDwxiE84YtrgRwrZh4iCPBO1JtT47gT3/tVWGg4J4W71uvQn662tMrgWN
ngdNMAqbZNX9vTG9px3bIWTzbqUr2bx7d3Lq4R+IWKp1rIlYibVmD3LhhNzp3T/cPn1Zyc+vn24j
JevDuD6NNYw14w8BDUAnvMnXLlVAU2T3T5//Bj1epbEDkKlXtgN/9DmCviFTpiRkBbGcG24gXHVJ
1pee8a1DrDlRc63zQo5jzgiYi6SEp4thPkdkLHcFj6iPksZBZjy7Gj2tey5w+P3pdvVx2BPnFIky
1OrzDAN5tpvB/m93Xs4Gr/NakKWb4XXMKC/AxuFtwPq7/btTL9WPN/IbcdpVKm47e3cRtza1AABy
Gb22u326++P+5XCHsfoPHw5/wXegMZnZdJcNCXPClDKJ2gbg75Lhwz73ZR/oMD0rQHuiXdGPN8TQ
gqh7RLnT5rhiBmaDfmlL8DZiLcMSSMweJrDWa4tJv2zhoWDPhomNkW1a0qyCgpZO94AK67zaivI4
WLibYEwXxWlYV4bvChtVdWt7JeL3gwq2EAtxmGqVLTvzFssYOIKu+fZ+GECWs+onomdt5UqepDEY
/1a/yCR+tLWTYZnn9CiNRtxovY2IaG8xQlR5q1vmnZCFAyPP6V5QMdEtwJoG8059mfKcAQKVPpu0
QHROpStnm+5W7t6jupKv7mqjGtm/WPDHwgIcO5aP0Rsj1yPiOz9bqwbNZBcfI76dBRTXPzmNTwdC
PVDuKnWlNb0MhZ7K8Vk/agsPDp/HLnbcXHVr+FBXfB7RSoUQbCJbWk7EhKEL1s60puoqDUcSVLDG
NZ2MnGAgjlCWKutd5dBQeT8bhJl/KM80/RZhWpY7z8AGHKH65bM9W1m2XS4w0dKnTLDwkSXjCxeO
pZc7pyfuYUl/1xwvpjcWvdjhRUnE0fdzt4QLtFS3C7Vi+LjVPUAcnj4zm2FlghjiCKkvowusqaMs
ZlKoN55QAeIUDT2rG5tM779ox83Ss1dj7ptVs1FVLxlUbhSLz9efn5UapayNC5Vdcxk3D1avwlsm
dABYlccco5MIoGFZcZwCpqMiIia5wWmbuDtYjOEySyagc16SFUgtJpfRtYC7QnlmDCBR6K4oqJOc
1hbUkcbubQ/GjLXMYa/xGrzH3KH9gQAWbxXgaADZpd4cGp/Zq7zP0J/PCCJyQCPgRRuLh8kZfAjI
QaH6d+Tmau9L0yIp7u72lu3OkabdrOEUzs+Gq5/Q0KPx86vCY4zQF94DRkrMdT0rWp3gCSdFS49X
wnuLvtIdxHQocXdQMNG7H367fYZQ/k9X6f7X0+PH+z5pOBVVAlu/fcceDxDbgOCia6JjMwWfi791
gTBSVWyx91dA6zCUgfPCxyK+OaC3ExZr/C9PI13y7Vx/zq5uvNBioVrLcbXVMY7B5x8bwZpk/DWK
hbcbA+dCDN6TUUmMXKgl7Xnw8K/A7VuLD/fHN2udKklM2K5tBYYG1PK6XOuCA9+gHuXAtQ1fs/it
HsSanpwNtoxesY63ZdOtZ8Hf9tSif383xjjVqT+r+60SqgKlI0riyuzpQs/FxRB8egaWnhlRZzgV
fRXccZgrC6q6QCRNX6CN4QD9YEQ6lahOLMuUuLO54rvO2kflxPpevO4rRF3j4Ys0RWnpSAA4gzg8
/+nWMsP/QwgW/g6Cx0vXwt2VgcHlWBcu/zncvb7c/vbpQD+qs6K6nhcvslyrKisbdFVetqHIwrCy
Z7KJUb5t7JtBlpMgV67x/qes2XzL0oJoteXh8+PTl1U5pdVmkfDRypGhJKUUVSvCOHSsR3E0RqD7
zuFoHVVFun4egpiGc64hDgvwlx1y/9a5X+/4XN0fii7a6ZLdFba9DXxuEucnqLDHSNQdvlqZ+c0P
FwZ2g+MZRtpAVI5C2DXdxdugUssVRuswibe13u4M9ziERtzvR6Tm8u3JzxfTUjmMxidxAbBWVF/K
5YijR8oQ1i49Dx5pfvILG2ENwl7+NDTd1FoXvszerFvehdycZ4CImKlubBlt59Ay3MVF4TY9+RiS
Df4HUQxOp4qR/JY/VFfHP6+TB12nSs6FX1/IsVo0SKZgSy5R4qjoiYqpGHuCZMK9fgC0xbMegqJR
pZe1duhX0X0mqXh1ePn78elPvPOa6TYI+1Z6CUL3d5cqkU+N4Fk89Id/gV0qoxbq4u1SUyy878hM
SVaVL/GTiFi5i2vlvmg6wtq9DcZfWmGHAgaR7vD+EhwEFpNylyHAVFf+b+7Q3126SepoMmymcqSl
yZDBCMPT8btUvfC7VI6YG3wcVrbcaxXH0TVtVUXJvusKLI3eqoUX+K7jruGv3JCa6fYYbZqWnwCP
pRP8cw+iAdZaJkLczgfXRB0/12/s5SzgS+qZ+BGhTR1heQFGXH2FA6lwLhiMX7NcODv8Mx+ljQOL
A0/Srn3XNVj0gX755u71t/u7N+HoZfouQsGj1O0uQjHdXfSyjqEZX49BTO4HArDGtEsXkDx+/cWx
o704erYXzOGGayhVzT8ZIWoksz7Jqmb21dDWXRhu74lcpYCYCFk017Wc9XaSdmSpaGnqov+JvwVN
IEba/WW6lflFV1x9bT5i25T/z9mVdDeOI+m/4tenqkO9lqjF0qEPFAhJSHNLgpLovPC50p4qv0mn
89mu6ep/PxEAFwCKkHLmkIsQgYVYA7F8iOnAJDvMZXq5oKyEucMtbUSMQt1WFpPGxNycViWiKcKl
aeuomvu8IMgYnQScgllptUtu+VaRRta+KS8QYbdJBNNshZgrzP5bJfSgwKjRfQiCJ5meRjW1H+m6
dKxosMuPvzaVSnYy/N2qXQbtzYui9HRvHfWYxnmnbQw6r2PImIOkI4stZTGzqljctHQcDAgmETlM
O1aTaPp5/IAxrd0dK+8cdEjZkWlhIgXUR9SVpmKsBH5ErjQIF9uUmolNtHAumnHpuFaU+yI3sstQ
yBKkq5IJJ1NSSmz5gg6ewy4yjkOUc7Fwoo+THO0FcKk4GhP5ODAwo2IUyY9k+UUp86M+qVpQQbpH
BNmRtaeR6dPOzqeQnsIcQ3WjlxkuE6oYeKjsPseZmxt0SKryu0AUzMpUhzML09qdpn1FDBE3RVrG
xvy53o8V7P2AEDMsptcSSXcscqQzBGvEU4/j+lzVvMCZC02dNVXp3GiqrQFjc8WRxoeg6iCSzNZZ
KcpJyuGwG2vidXdbIW6Xvm99dJfNZ0/iQ8iTTyRmppHY8H5hQWN96f/m4+n9I1Bwmqbe1TtJrxiz
a1QFyB9FrgJX3eEmclZ8QHBvHeM2lVVxooq+ieXD1/9++ripHh6fX1FB+vH69fWb59UewzZAdWjs
Xrhh9YE45w0JJG0EtVMiZXfyM3+armdrP0lpEPj7ZkLCTfL0P89fCdcRZD6eNefYCN+XGxN1KmLK
yxVp6F/44ibAvU+g0QGlNfcYQdo2lab8F7/8XSWYLRCpd8cYjYqlUHLLRAlgcPeFEkRIdWni9nYS
Nsgkoq2EL9JwUHhJ7lhsFf67TfweylqiD0wifiRbZcdxuUrLVMNf82bRhJWUMr4jOtId6k8xhsmE
GWWmL7Ztu5ouJ3TYsz+ELEvfNJ4hbUL6ebuNt1jQ9p50pedqDX9PzzIX2/AcGFaWLqE1iCv0Xw9f
n4KVtVez6bQJxl2U0YJJ3CZnE6InIKKHqu/JvYxohl+KtSdZQAoayJbYI5ytm1ZUxFvY+StOTt22
d+QOdlKVTD3PG7HdoYAzHbskT02CUUf5SuyeFz9GphgCagxpMDhEga2Q6JSirImvLfKDf/D1bJVE
50RjskFjfyV3CQXQ5PDDD5mmhzSuYIzzmivWwvw1iDCrSJfW8WvsfbqkvmLUUp7XIaok7s0j9KLp
OU+yoQ5fuKv1nT/KPl1aWwlU1+q6Ii2JLlsfev2Pf3Rwm68vTzf/fn57+vb0/t67rN+gkzCk3Tzc
IHj/zdfX7x9vr99uHr798fr2/PGng706lA03tb1n7+sJqWSuTgMHCdxMlK97fSqjI/fK6z2PQ2Je
hIj7AwkE7k2hZYghNjYhzXgi3FMH2nnr9wS8SshTiM2FEtRG6+tllJpvPdzn+eLRE2B/vfxsf8rK
S8XALLA2rutFIavQMd9gZHA+6Ly2Okl/ok9wZPboa4m4tQbeaogKrbZ3yhWF7W8zZd0Ku2SVlwd6
8XYMu5IUy1HOXTs6YPu7uyCdJZ99rogVrWgTstxjMABV5dZRAsIPuGXtVO3bzzA5J49opOyFCpn1
PknF2dmaPz283Wyfn74hcN/Ly1/fn78aT+mbXyDPrzeP5rByzlssqa62t+vbSey3EXHnX9yEMl/M
ZkRSqyJxnhy1B4wc9tJ1vV7st2bPHK4NP9VcR1zVMSwdyohlFMxb6e7IlMKsIyWIZobmMMduUxXm
fHK9umOVFsHNX9b7uijS/sbM6WVkd3PrrxPcVcIyK1+DIxWpvukw51y47+BH9ziAt15QZsWDDi6b
lJcBUGNdZl4xJsXBU/TKMrQhbIa5VLhseNL+FDMdPOcxtiWjyTPBFOTFHikmjCLslUsYWxgXWh+o
xYwkNCWjNDZi9no5VUGrJZBWVrSYbmixVtTlwlQZOn6b3kB3NJjjBt+AGVzDwwyloaEjJ9/fyPFT
A2MZZRXhXyRb7zsf3ESsUgDSOsEG8cLHaD2vg7Y1/M1BKSADPpLS24P5pjYIwtmctSF5en/+4/sJ
wxuwOeIV/qP/+vHj9e3DDZG4xGadLF5/h9Y/f0PyE1vMBS772Q+PT4gPY8hj1+A7CmNZ7leJOJEw
QuauZjqC7aVPt9FUEiz9reZqzUOQFj1qw4jK748/XuF+FY6jzBPji01W72Ucinr/9/PH1z9/Yo7o
U6dCrKVgy+dLG5eOQJDAF7fwTChqW0ZG68bRtfa3rw9vjze/vz0//uGjQ94j9BS5TrHo4RWbUZKJ
S5X4UswY3fL8tTtNbopzYIiDdcXcy7QkLeFwEayz0r8e9Wlthg6cpFkEoRPR4dU5LSpb0xAvZR6Y
+lcYffXtFSbV23jsbU/G7dD1HRuSjKtGgg8WOB5TDVw1xgCq0bluzGXc5+0Hu19FMsDJboERia8c
M/Tehq4vRvhFwwUd/VQRi753znLbYF0SXSpjSzEKh0odmR100EhUjFXSMqACoCsGrtLo400ZqZEp
trcDy2qn32j36sFsEUb2UBfMG0tIPh5SRG/dwL5aK9cdFS7znluX/W0kxjBNpyrDVfQSprve1l1a
lrmiel+o+0RTn1kIx4SE8TrGD91Mrq0/T5C4NRuoCfchtw5m3Q2RqGfidVY0tQs1kO1Vaz9yvD/Z
pAvCSM9hAk2ps82JtBwk5n5vKkAAPnNpqgrRhbKQFe5yzsOWfrisdkaz8HCWii26C9VMUBpQ0QWw
9qJMINE6cpGku2LzyUvoopa8tM7t00vzZgf8zt1hKbY9TFXi4wVbAlr/vDTrYxqGZDmYNzZAxUfB
HhPGgbBJLaMN7Mlxs1rdrik0gJ5jGq0cuEfPx8k4OHU6GKO0GQ8qyvYCNw/IQTcnL8Mw6pHSwQ3Y
S+gxk5TI46VbUen5/ev5qomTRbRoWpAR3Ai0MbG7cY7bq0MyGt3zKXrIsvvw5SW1yTBwjf7WPezn
BU2r1TYzGzlteRZ6PYv0fELBCcP+khYaATJxtqFe2W3QHjaxlAQKKhO9Xk2i2L2cKp1G68nEuZLb
lMiN8Za5LvDdMKAsFg5KVk/Y7KdowzlLNzWuJ24YSCaWs0Xk7KZ6ulxFvoS0h447bMh+wdUMH9xK
Uc66exMlYlSxhzHtSovcI5hWnG91spXetCiPZZwz9wARhbpf680tYW/MKBHbUtq4jubUuA5Ux3+h
S7RoWWO/dclZ3CxXtwtPtWAp65loqMU+kJtm7jmCdQSV1O1qvS+lppwKOyYp4f40dyWa4JudPtrc
TidnE72LI//74f1GfX//ePvrxTwV0YFlfLw9fH/Hcm6+PX9/unmE9f38A//r9mWNl2vyCPt/lDsW
28/dVGmjlKIWErrgGMjF0vNOtmAUGYN4NFDhzxWGuqE5jlY4PmaMlU6KPeNRgZ5scSoK3gRoWCqE
J+Q49vEmzuM2VmSne5uwp2tSyRBQr9FrwjI5y6PveSBiqIA7ragMjlR+0NSbcui2czOdrec3v4Cg
/XSCP79SqxEuAhJNYuTX9sQ2LzRt+rtYjafahpEtECbRSMjU0QdyRGch9HXHXXzHaA0szEOitNSO
pxNJwc/YHeKKtt3LzwZg4YJzdS1jBls8FkcOiluVLOnYcBQUTBkF3wZm/iGhZYod4+EH7dPh/X38
LmEhL+jTmcEDgvT2aEbGvFnL5D5K8hm4zn0qcEDL04xDSQeRPXCLG6WVKvSYs9qnZ9j0nn//C5/n
1lY9ETtxgJ66o9dE/WSW4QjA8G5P8MX+gHtAArvLTPiP48h0RjZ/JhbTBd13cKJKGqG9vi/3BYn2
5rQgTuKy9kFKuyQDQ7pV5INybgE76S86WU9n5HsQbqY0FpWCSjyDKdxGRaGZBT9mrWUI9yg5iaM7
emp97SOy+EvgmTeSPMhz+LmaTqdtMGUdiYtX2EKpDGx5rpb08CLwT7PbXGs+7El5rWL6AypBp+PE
LDxZOK5Tun1AoJ1lkEB/LlK4Qbk2Ow5VUXm2GZvS5pvVigTjdTLbt4H9ZbWZ0x6pG5HhFkpvGZu8
YTDmudlWq12R0wsYC6NXqYVkZZ0iICPniDh+sAhQODc5pfB08nRq68CkTJpR3UxHdcjIuST2MtXK
x/61SW3NeFn1ZLq/BjI9cCP5SJlg3Japqgp8afRq/feVSSRAuvO+JtxhiCwmctGbtTuJrz0MJwD9
JU2LD2/SIgrt5O1Umvg7t43oSUl8bjcX2lA9NVwa3dGT85AnDK6mUx6+nGBeUxwnoIyutl1+6d5i
HzvZpLR5ic+F5XCwZKjkDhfoeUkWcoucmPtDfHIxWB2SWkWLpqFJ3bsYY8um5LYjjethwDdhris7
+ooO6UcmiqjhsoQnwkiZs7XTW9an7MrYZnF1lP7TQ9kxS5jnK/UdEwqr7+6jKxVBLXFeeNMoS5t5
y7hOA23BK4SAqk8XydvTlfYoUfmT4E6vVgt6N7MkKJaOE7rTX1arOecOGlRanC2LXESrT0vaAAvE
JpoDlSZDl97OZ1fOW1Orlhm9TrL7yvODwd/TCTPOWxmn+ZXq8rjuKhs3LptEy0Z6NVtFVzZs+K+s
gpByHTGz9Njsrsx6+G9V5EVGbyq533YFEpr8v+1Yq9l64m/c0YQZQSDxfsaHtK5on+9Tspr8Pbvy
lUeVKO/EMtgkCX0dczIWd14PoAqS25EQU/vKydkFRMt8p/JANwtyOawGsuB7ifa9LfnGj1u4zDWC
FZED+Tktdj6S+Oc0njUNLal9TlnJD8psZN5y5M9kzJPbkANqmzJPaP0s4lt0Aw+U62d0dPliGFD1
yEU4VtnVWVolXt9Uy8n8yjKsJN64PNkiZpQNq+lszUQhIqkumKe+V9Pl+lojYBrFmhzxCkOxKpKk
4wzEHc+vSONBG171iJzShdBzCUUKV2j440naekuPCKSjiVxcu7JrlfohL1qso8mMMn14ubylBT/X
zI4DpOn6ykDrTHtzQ2diPV3TwrosleD8h7Cc9XTKXI2QOL+29etCwMYvG1rDomtzunltrTNYFD8x
rIfc34zK8j6TzDPDOHWYV5MExqHlzOGmDlcacZ8XJdwRPXH9JNom3QUr+zxvLfeH2tupbcqVXH4O
xE4HUQqDkTUTBl2nZLSSU+bRP2bgZ1vtYbenj2egYsSECIJIzos9qS+5D1lhU9rTgptwA8PsmiLB
WrjcwjubV9woflvteNIU+prj2SYJYzJQJbPZmyDNTfgU0XgC7+8DL+hRXDNyLEqo6/Uio4UFlOeJ
R2A7zyrdWxQIbShBdVqVMmgcZUmn6yCDqWn/+v7x2/vz49PNQW96g4Hhenp6fHpErCVD6cMk48eH
Hx9Pb+cGk1PqBg/ir1EJmoWnVpKtIvJxWi9fvfePOiJ+wKNinE0P+drBn+5sWA6XZUFfzA2FFQuB
umbzLe/oVXxS6TKa0vMLsk0ndIknkc+WDSXy+z2V+Zcpk3AlE63KYxRs85m1+dLUSmSaW45I3NKb
qduaM51QrCrKb8DNc6ZIUOUp4rYmpEUc7ZTO14yOGGiz9ZylndSW2vHDZlZaeS1FT9WYXqb4bhDj
C1cu5l2YO02ulM4WlDHfbQ6hc0jxwfM6pivtiS1CtqK7Ir3JYUcwppLslK4ot0SvVRIuS8E2kdW3
y78ZlYuhRTxtMuNp0wVPW844P7HbdZCP+gpKwwBLX5iQU80pdkYO0tXHraGKQ/ViVUcNedp62c6v
DlWdrqYrKiNQjAew59Rn2NcRY37pqMzr7h014am30Sy+SGUuwPYjVvJivReocAyx9Z5W1PPSXq9q
T5qDn+2aNM65mbT/5tJpGl0dPV9oPKXTiNGUIYm5XwNpxZJCVR7Rhi/3iXvrc0nGPiZzXz3/uc5x
2zeO/PSKGmIXT1rRm4pBFAx32LHZnEU/a9AWSAuHh0+q1oeWRxsDQS1ojiMkUtFTSieE18f3H399
sM4lJtDPcXvDn2dBgTZ1u0X3zZQDiLVMFloSkfYuMGVxXakmZDKtPbw/vX3D12i8+PUwf4GgsAw8
iWX5VNxfZpDHa/RAvnM6kws3sznv5P2mwPAGV6XcpYG8WS4W/mrmmCjtx8hS323oGj7X08mCFi48
nturPNGU0UUPPEkHa1MtV7RYMnCmd9DeyyxhSCnNYRBdmEf+BsZaxMv5lEZEc5lW8+mVobBT9cq3
ZatZRC9yj2d2hSeLm9vZYn2FSdDLb2Qoq2nEWC96nlyeakZyG3gQZQk34yvVddq0K0x1cYpPMS2z
j1yH/Ook0XVW0pv42HDYV2gFlTP0M1hfV4a1zqK2Lg5iH4BonnM29dV2o+GlZXyuRqa4nE6Zk3Fg
CkB4iAlQ35lnIIntw9k+nbAJ/NmWOiKS2jh18R/G9M19QiWjnh3+LUuKqOFCXPpPcRPEVmcebO/I
Iu5LP/JgJBno2f6BkvFcH+gyRblA0K48TiMk3uMUPUxObWZWkMBRI9MWgWZDz6eRfMzM/y8W0fdE
kF3LSjHaScsQl2UqTSMvMME8Wqxv6YViOcR9XDJ6pMI+HYFQQtGl3oIJxzm8WAacMBvmHmf7QUyn
k5JFyEeWo26aJr7UUvZo6Tp0mHuXv2bkQz3UReED4UBpPYplMeCXDNiuZcDh06KSjFm8W8pKc1Yf
Nae9y/cPb48mxk79s7hBYdCDJ6/c2C8i8CbgMD9btZrMozAR/vZDdGyyqFeRuJ16YRSYDnIjSjSO
NNulC9xQiGViyana2J0ryFbFJ7JfLLVzFwwKDmvWEWKVslVD75hd86zJcbm51GQrxfgZD4ZEZNnF
mcEXcJn7tDbXICZeyNSmczKfzA7TyR0tIwxM22wVAmd1umBqBg3O39Rtw0rwfz68PXxFhe1ZSFJd
33tWA6rPERh7vWrL+t59F8W+lc4l2sdS/hUtlgPNYNdiwCVGoQ7u909vzw/fzl+xtRutjZgTHuq9
JawiP+pnSGwTCUeViGuZGHhg7zEXl88Gk3nzpydNl4vFJG6PMSRxemOXf4vKPUq35TKJ7qVDujEu
3oVLkE1ccc3MJCKCUR6FLldeGfO18zqAS63wVaVMDixkRbKBi33CSP4uY2zeiG2Pob2cGqYTPjDL
fFnC7yBDw+totaK0LC5T6r0l7/WdSojKiy2JCGeD/16//4ZZIcVMWWMiIUI4uqLgRjFjLbIuC2OX
tSzYkamqKVml4/Df23ASnQkXlvqJCQ7syFptFRPy0HGgSKfol577MoTIG8YC1XNMl0rfMjJ3xwRz
cyOrJGaiGjoukKeWs8sFdcfOpzresc4cPus1NrVtlg1zS+9Y0GnnWjGdMbPUVznh0LtErkr+RAXy
VsOwldfqMFwqR0zOa6wCHQIMOIDaKQGbOh2t08912Ku+TGe0qqKfESUTD9TPOlgI563qw7L8gyRY
EJmoK4ucRSyHHBaKQYBgqs/bHbNg8uJLwbjUmWB7WEokklJXMQIneBcuJ900GE7nMLQaktDEk9fk
00qVMTM5B3J5fu6UpX3/3VOwonh4HnzUC7xwpwUxNE9St2yTakBZuvecRgHZUDBG1Ubj01I0MlmD
uDWObWPSCdrwaRXUi3juQdIpRnzlYhe2EKGa8AnkF6/uzc/UvT91z/B5Vrs+0T5yq4pMkijmA1tv
oTwjBHEvI2ETz0lfo5FjJz0gzJEQuIG4BBxlcihGJgHTjtEojUyNKveyosIfkjr1TfxwG4a9gTlt
ivyeccXITjGJ7WGf9rbreARQF6vb2fLvfnX3SxOEzXC9w4jTYwWEOw8fIT/aeO2RHq7DfcncIWGd
7MReijs7PYjaagF/ysydkM6cKpngfMykmOcBLI0xHPZUuGB3PgIv51mRiIbdXJKucS5bfjgWdZGP
A4DEXAs/gayJqsFjEBV9uUfasUYstapoKI+loQvq2exLGc2pb+xpTAz1GRsitLjFyFQwT9rBIZ7e
eyAvfQrihji4gOc3scHc2g1/dUAEv/LgmRRdGr7eY3F8zk0k8F3nZiYXkwbRLMwgFnBJ2nkvfWGq
0WLCIHmrBgn2EU9qd0YiPhJsIL+9PMEbQB6tQyvC2yBTaK+AGz4s7mFh371vA3FtV3gvkPWJpdg6
EBJDYuyOR1DwUNlwz0bsmbFLO2+tG2gcpP/5+v5xBbjLVqumC0byGehL2kAx0JsL9Cy5XTBP0Fgy
RlNeorcZIzuaXeFMF+ESNaPotMSMOfqBWCrV0BpQs8cYL3m+UdatHjZ4+tUnM4GUXizWfLcDfTlj
PIEseb3kJ/BR0UrPjlZW5+BmuPa4OaJFdo4daJbzf94/nl5ufv9rhE3+5QXm3bf/3Dy9/P70iN55
/+y4foMb6tc/n3/86i8QgduQf2RiciIR4NqgN/h3yICo0/jIU/vrcrhhuCyMBx2yyV004bYVmclj
5Lc5PND7tNbiZav8fxm7siW3dST7K/UB09MEuIEP94EiKYkuUmIR1GK/KCrsmu6K8TZ2ucP37wcJ
cMGSoHwjrm3lSWJfEglk5jvpE8qT4GPVdk1ppniU92z20iVWCVQRYDJdMREIkP4xvJrZ8Lq1LMCB
6vHXWP0WG8RXcZgRPP9US83z+ODS0ZPJgrgOmIA85HDvdXY1Gce3f4uklsS1wWUlLJrBcp4vB5S6
UFsLNzUKapa9q5HKluNeO7zLr9Gew2ljtbA7TCVp9A9j10Fh4HgH/Hh5C6kcTPl9Is0ssLfcYbH8
1BoVduoYapt2AcF6BGWMDqN5Krro5OVuroZNPlTelRddv+5vTvywPWIDaU5p6UigVu4YAlGzff4J
Y7JYdkDnWQZ8rvQpRkHk+274WxkkmYUQm/kmt4xEgHwa4KDW4BfCwDFaXHvxZU3CjhaCQQxJ40pB
kA7XTkYo8VkIAY/HITdATZsGt6bpzNorLcvGrDYQnT5SijZx2i1M+lHMvvrw3kxWLEj0esVoUr9s
0MFIZ3yiqFF5QZjYFgNqkaVC0Boq17qwG2sQ4lVTb7eg+PK21hXervpRZ0k04A/vD09td9s94Ucd
ObRaWOKXQfrr89vr988vv7Hn6rIip+t8GSH4J+dx4+i2xrL4XylP9D4aA1epcKl2kzRVQq8eLSEk
2HhOujBebReAvNPtR/dc61Pxw5De1X0j193Y/pwEWEn+/ApuqHQ5BJIAUR7TK3XGFtl1iFtHJRt3
fErabW34TIwPMN98lGdjO80RlDdFaItpTOOmhxd2Yhqlnrlo/5KB6N++/XCF+qETBf/28X9RN8RD
dyMxYzfn/Kf2668yKvVoIAIv6HzhBR/evonPXh7EBiy29E+v4GZT7PMy45//rbWUkSFMJ/3Q4pZ1
/q4+gN5wGSOTM9MRuMnQXZrCUdDV+Hf5Bf22PR0K6woNUhL/wrNQgKZvgX1vzBvrqbFUOQ9TSs08
JL0tXWKZZ0GiyYUTHWLjhDxgptt+B1WHeg/qIlz0WmM435+RK4kD7AJqZhja7RXJK7+maUIDt2b9
IwtiLKtjUTVHdKhPaU4vzm/cFpEnlk3+fujzGhfXJqZiX/X9+3Nd4fdvE1vzXmyLrp9ru/eaEryJ
Pnpc9Uzl6o9X34O4uVj54XA83E2qqMocHLrjjz/m8VMdzlV/L8uqedzD3du9PKu2rQe+OfUef/vT
vJNuSu6mVouOvsfzDi5Z77crMGzrqvFER5u4qkt9v/T8dOhrXt3v8qHeuUWTa2QvVt6fzz8fvr9+
/fj24zNm5+ZjsQc7hGcSC20PjnIWp85i2Bsi1UgQJ0M+yKgzKpxgTOjEcdxaKmN5khz9vVqp1P2T
bdChFjeP7CeT4u+5Hk1e0grr7mUm3s6Ywl/C4wprpSSfrAaz7DLGUv/y/P37y6cHWSznTCe/SyMh
D0pH01+sYihBHe1ghbdlh61Cqg6juyOjR8QJRcU6NROCRw2+dLYD/BWQwKruvM0sCgcD7k0NhyTu
m0vpNHbtkU0lKJ0VnDHtsGrzDUt4erWyaavDB0JTi8rzNo9LKobtcXOyMUugnoZLcTw4jXW+shiL
GinBS1FmYWQXaDSrNYmg59uagsTKmFFCkZAt/jGi8OBoZVRtU8LY1Sl8PbDU39ocjSI7QTJYntlE
l/oA/iZtKidJEbG/NCedqyWflWuS+vL7uxDZ3BqN5gL28qCoptvtETl0VpPvLjelcDKrrWYuZu6z
wNRty67IszjEz0YLQ+pNtyu2LHYG79DVBWUk0FsPaRu1xmzLO23W1x+OloMuoG/KNIgp+l5uhAmj
DPlM1Ie0l7PvQ1ujp+ZwF2ZR6CQ2yV1rzZ4mceC0e1/EQ8xw/bsaq/bDeKN91Xt3a7AMHU9iSpiT
mQRYgsmVC56RwKneCOAqc8VxaTzeRdQsalmWRcby4Hb3HLbEGQbOVuG9dFBdO/js0FRnCFnouLJO
+xQMI1jfILzIzWOGMjFViovi1xCq78sipB7XGarvj2V+rhv7fZIWkgVrQVA0rE4ksUmTJLL3GXgv
ljmLolpOiE0twpAxdzR3NT9y7+577XMSBaGd1hTtYXlt41ZAVuz8+uPtlzjRruwU+W7XV7tchW4w
cykeT52eC5ra9M2F6HPgQuD9iiN2kn9A1EmpRl70OfpHY8BtsDU6ojabM0vJacSoleeMkQuu01p4
vA/hFxa+w1XiSC302vHPz/95sSs2KrjBjhyvlmLg8OzhC/IlVDfAb89MHtyKy+Ah+OJppoN5hjc4
aGg1/gyxABOQjI/DwPex9dLGw/MHNQhRQ2GNIw60zVcHUqZJuyZAcIBVQeTrNlaRdG0YjcNlPlbJ
UHYQJkSP6bEQXe2MhpkHKBuBfw65FRpE42mGgmYxvmXpfO2QWFZ+CBM4FG9yOyKMwSALcyeZUQr3
pKHQ+U0ZklZfwQONm4xTvGjc1WcoBsFDWhyaowx2zXu3RIq+FuxPZ9tfWvRlT1fmilG7P8qvLKPx
SDZewPBBUZGENjncz7y/Mda1LNEjbIBSeQevPYTsHCTaiJ4+KS40IPFS74kOMyAJcLo+ZQw6kr6k
U5fON6bX2rGcgrxSv80TTa+6U1MLMB/c2OC+fPKD5XA7if4QzQyjAqlHnpHYWMgmRHQZSS3hzseE
zzeDiaL+C6b2mXv4i42II4bo4TB0+16OqSDEmrvpWErTlfzMRWZJEZxB9m4hmiFMYoIWgURxmhpB
1UesrAb5ckAxJTG2GWnpTAcFFMlCFxE9HJEYmRMSMB1V6hCN8eOzzpN63hZpPLHIe6VGwMG8hYgz
ho+reb60mzBa60B5NgkypMXGc1DqzvFdftpVaoeIiAv3QxyESEP3QxbFsUs/FZwEAUV6Rh1N0bqX
WZahnnT6QzwkhNkLp1xjrZ+3c2098gXi+K5gj/jiOjy/CUEXs4gaIxiVaUi0o4FGj7x0o34L0pLA
Y69u8mDilcmRmLZ4OoRb1Rs8HhFM5yEpPhM0noyip9uFY0ivJMALOohGvfdx5P84Qv2YGRwJxftA
QKjOxuSI0ZyFZLb6KS/ShBJkTFzr2zY/wJFJnHsaLO1HBi7zV5v8kQR3ebZ5S+K9V2iYC9SW4NK3
371HGwmMqnmLqWWXqoLnPu2qfKaDRRraeMO1Wx92hfgjr/tbYb3m8zJ2HPM0OXGVPMFCmEG4MayP
yqppxNLaYg1Sx4+iyXDLv7HdUyJORVus4lJVS7dolLKZJQ7TmGNZ7zxX8xPeFiRMWSiG7Trflhf7
FnPZO2fUxITxFquBgGjAsXPtzCHkxtxtU0GmaILqDSEmH08s+3qfkBAZYfWmzXXTAY3eVVcstzqO
Ue2vNpwqmFhu+UGd7ub0roioyyumXE8oRZespj5Uuc+N/MQjt961lV9xIAUaAfMm3gbVWyc8W9Q1
rslB0WyFkIVMJQCofsAwAIoOCQndq35EE2RGK4C4BQThUvyHAxRpSKAnQRJ7EJJ5gIThQIbnEZKU
IiNIISFSQ4jxpxYtd/4DFGIOlAyOCOk/CZjnGwPKMBnTLGyGTNC26EIh5rjAUCRxhNahT8UCgykc
lk25MF7aTT3fJiEyLlssEqWghugEaFOfleTMsC4KCQZMFbXADG1j8JN0J12PqymNYa2LmjbDVyMh
ua1/Fno+i2mIK+8NnmhNNlMcyNqgzMrQAgMU0fVOOAyF0r7WfPCaxo6sxSBm7NpwA440RQopgJQF
yNw9dEWb6lqKpexbFmfabOjM6NQzH04GUZwmXmmfpmsr5qZqbt22Qva1TXsrttsOybA+8O7U3+qO
m28QZ7wPY0rXelhwsCBBJ3rddzzGI9rOLLxJmBBpsMlO40A2BbZBpcwL4KpKjSlknkh01r6AHU3N
fSBAdkOB0EAt61jCAovXGkQttAwZjIBEUYTvFyxhSIu0nWgQbPK1SZpEQ48g10psfGjhn+KIvyMB
y9dWk6HjURBh251A4jBJMyzpU1FmwarQBhw0QOp+LbuKYPl9aBIS4OvLpbWlUYeHbwaOPoGe8P1A
ELlBkPF9WwDh7/Uc90OxfmBaM7majzVtJWSKtW2iEkeIKED3RgFRsroxC44EtMlIzVteRGmLTIgJ
ydATukI34ar0wYeBpzGaa5tg8psQIAhlJSOIpJaXPIXnEMjiK4AU7b5c1JutL4OHnAbo4AYE9S6u
MYSUEqx1hsLjx2xm2LdFvDZxhrYjASINSjoiTUk60jiCHmH9DnRP2dsuJmuDCaIkFN1pPIs53ws4
YQlmBDZzDIQSNO/zwChq4j8xXFiYpuHOrScAjJRYogBlZO1QLTloiaeaIa0t6ajySSGwTnled2uM
jdgvBnT7VmByWNNGCJ6EpvstWmqBVPvt9ArSZ2M5TxOwf3aUUYhu6DEgqD5QinS59sJ+JIBjYNsn
9wTxIR9q8EqHXStNTFVb9bvqAN6zxstF0ADl728t/ytw03Su8xyOIx7xboIvfS0d4d2GXshWq6xl
pcwrd8ezqEvV3S416j0R49+CXozvczM8D8YpYzXwDnfEMX3gJIngcxGxHIEBrMvkH3cyWkrkS0nd
sOZNcyxyn5RfVudtXz1N360OAZAKrQhrEwgvdpFvp1dt88BcjAOlnYQ2YEcvym8vn8H+5McXzO2a
Cvguq1U0ubnsKYwfi1s5cKw6ywwUrGEUXJF89NSABUtnfrCwmpZdMHC2tJYYXnOtoWtZNzSJkWXy
MIOtVXwjmo3zemO4eOMb4we4ODq2JqkraogDgX89oVYqZX20v1nWMI3BU1AV9R3Slo7CfKmYbPiC
ubB5XsJvijZH6gZk89dN1aioPdwzjpFFz1nkpfAWwLdNzvc4N8R7uhXtwYNapjUKQ+3gpNXh//z6
+hEsvNzYPtPk3ZaT7f2cqKQJMdpzqQtwXgwsi2KP11Vg4GGKXkhNIDUkXfBYrB42U/yiV36WD5Sl
gWMLrbOAyxdpLWsFlFnAfVN47gWAR/rFDVBRVMLTc2B9VZJpXzsaXD1uXWSDjhbrlpcSgFrwpII3
pWwXWEY9j67hc4Bj6g0gqLF4/dtOLJjmZAIT3UP0RNOuv0ca0Z1iAm2XDxVYIsp7G5MdLmqMdywa
0TRE1gHjcYsEOprQzKTt60SI3LL9tNvwATwV8LowlHlAFWl2HjslSE0t70+nvH+cHT6gzE1XeK07
APP6Kpk3Ntt3t4flVuyHy58ylmCqfady4KdSyqZ/wufzp7GwdR6/K5LjiSeeMOkAv8sPH8QKeCxx
aUNwzG/uje/kmyBUQbKgsTkA3Ydiaj6Or3RsqmU0uVD1lzgLlSUYbxba65KkM0/Eq5GBZQF2+J9R
Gjt5sUzetbgpZZhqXqJDAurmv21aljpLVnXYUrJB78OrD2Dsn3dmOsVIMpLpqwG7rgbIfcc1UUBx
YewdE93v5xuycp/R66h6y2OUeDS6sIiPTD/5S5J6iWPXjVfF2k7F6yhNrujey9sY1QdL7PE9E4NT
W4vzzTUOAiehfAO+X1dLADYjk1Aufrx+/PHt5fPLx7cf376+fvz5oGxK6ikSC+JZAxjM5ViRpnvV
6aX+n6dtlG96BqvRBnCuEIaxENp5ocaBhs5mNwaNpboJ1ZhK057sZu/yps3R83HHExLERpBI9Z4M
P59LKL3a6Ss6w971LXBmTb/5dRqSGIs8UVymOoqqr8gNI0ec+HZ9zULIprLkipQzI1jpM0JxqruT
z4jl927ExOrueaY1XJooCL3DfbQ7QmcbhKpKw7WJ0rRhHIZOeVC/wDrDbHZlfvfUXhluFQSwY2tp
oOKUvz/kO9R2VYqhrvWbRl4RTycOpOELHqUNxS56ZPO1sdKdmo0qqOjkUCC2NUmqb2cSYBQEyCch
cYRujGVNOAaWOFhpm9ksTV/0j/tWGQ3a8uuEjE860W9shA8gqhGbaDhvkCWxbW17aUDTqYFt9ZsS
xFoS3Kx9erGuWzsizlloN4U2yXbgtADb+gpe2I/NkO+MKbewgDfYk/LizE+4m9KFGRRhUg82s+OJ
Coluh9suGjwg9RlCzYLC0Zaha6LGU8Zhxjzfy8MtOtoWJr81qsFD1B0MnoAdRg/hWQ6rDqjkMQxQ
B1UMmv2eIAVSx8HV8sDpUH9maCDUNCi1MHzV14ZbfojD2LNwWmwMjzU5M5lW/AtdHSnx2ivsHIfr
Sde8ycIgxisK1/w0JbgiYGETu1ESrnc8yEGpp6QSw26ndRaWmsbfJna3mZXMdY9J7Y/rJRE8SZpg
CwxmSmGisWeXNbh89tg2k37CMzCWRJkX0g9TJgQHNs9XWUzxATKe6f6oUqiYaTOZR1ELZcG9RUyx
0Ts5jVob08Gniaf6KcuEmP7KUoc6IvoEx7o4Ignauh1jcYZ/w5RIi1Wze0qze4NEnJLNW1YT8wQI
NJnie1NGnc//gAl9KLCwgJeGKEbHpnlw1+njcRxp1m7LroFn9e62pw8VQbUyGtNZrMn4XJEQ8yUO
IPpQV+O5tFiZn4pjq5zZoeuHhE98cztbLjMdzj7n3QZcVknng3PUrls+SO+ISJUcvYIGmdoFDZh1
DC4kpEr0kyFi+mMEHTENl3SkPZvPtRds0jystgZvdjEEkMaynYRcPHWReIA+ZDB4GDWkXxNKD1i2
8KaKiBmIfTaf7NEyAUqtCYcyiYUI7U5ME2Cj2b35LNlIuN7umprAh3kESYVG6wKFdub3JZGRP6qI
zz2IdizwvOVYOMbDINKf9knNmtBNvqk3RsSn3qujK0b13dKiQDkcBwgv35vUrjbuy0fSTawKINYd
3mHnSggzLznBONpynSzz3qchxTpdgraMDkT7bhCWr+7U8IoBjLY6sPR5feD7vDxebDajqFMx9UOm
DogTH/juwk/ZI+Om7M/S4T6vmqowLghGB2KfXp+nc+jb39/1KHFjg+UtBEZa2sxA80PeHHe34exj
gDhBA8R08nL0Ofhj8YC87H3Q5BPMh0u7db2rZ/9XTpW1pvj47QcStftcl9VxvEg0W+cobemMEDnl
ebNoB4xMjcRH1ymfXr5FzevXX78fvn0HpcBPO9dz1Ggr6UIzdXkaHXq9Er2u3+YpOC/Ptv5AAUp3
0NYHub0edpXmwU6m2VYtBY8FRhNIZHs5KPcFmgMXt05GC8+eo50a240KbWn3q4b21dMJellVVbkp
+vzy/PMFBrns3n8/v0m/qy/SW+sntwj9y//9evn59pArdVV17aq+bquDGLO6m0Jv0SVT+fqv17fn
zw/DWavS8hZIjIfWir2uQQfdBYfkza+ip/JOzG3+F0l0aHQOrHqKm5+VFThv5ZX03XprjpyDYzt9
eQKuU1NhziPGaiIV0ZcJ90HPOBWLeppp+FYjp/hUJ//afGzBTHoJ4Chz+vjtyxfQlcnMPZNkc9rS
ac45dGQCSboYz0fd+GBBylYNs3qHptfKt1/aw8QWXkHnh+OtLYczOleHbqev44K2rF/qoQnWLMA2
zzzFZc/cur2y27uuskuqzVgZ66rJC0NdCWPhD0oA66/NNnVM2xb/hDdHDyKtKVaBflcFrQL9LrYg
Y81QK7OnPue6LZwWrMGcHiPC/ummAABMIrFY8b+SSGv2KQuKmZFOaCHWs8JuK73MuGbXmCLarHn+
+vH18+fnH38jT4HUHjoMuYxarZ7S/fr0+k1sTx+/gYOt/3r4/uPbx5efP8F7NTiZ/vL625qCqtjD
OT/h1/cjXuZpFBqaxBnImMeHyMhR5UlEYkxQ0Rh0K+dxBPIujExbBwUUPAwDTBM7wXEYxdhncdiE
FDuxjOVoziEN8rqg4cYuzKnMSRg5G6kQX9MUyQvoIe7DYBwmHU1522FCvGKAQGe3zbC9CSZ9d/yz
/lXuc0s+M9pSAc/zJGZMT9lgX6QLbxJCGgB7cbfyCsD1JwtHhAZiXfAkiOzWHsnYrAWIRcj4HAGP
pKx4NgMjmZ2ZIMYJQkwc4iMPDE+u4/BtWCKKmziAaPqUEGe4K/IVmWGgdU0jTFM/zd0uJhH2JQDx
6tw8d2kQYIeWEb9Q5vbDcMnALQ9GdRoHqAQZJOfuKk5LgXOiUGMOhvKzMdLdJUs2WOofRMWVxiwK
HNESHeQvX73zJFWdi+XOsEsnbRKkTi8rcoyRwyjEh2+Yrc+lLGQZ5tZhxB8ZI1enW/ac0QBpnLkh
tMZ5/SJWmf+8fHn5+vYAsaKcVjp1ZRIFIcmdZVMCLHTzcdNctq9/KhYhuX3/IdY2uOqcsnV7IUlj
usf31PXE1Cuasn94+/VVSIZWxf6fsitpchtH1vf3K+o00R0vJpqLSFGHOUAkRMHFrQiKonxh1Lir
247x0lF2x4zfr3+ZICURQILuOXgRvsRCLIlMIJGJkgs+bPRn9n61jDHop436w9d3L7BHf375ghHe
Xj7+sSjPXHFHuQ3J12gz24iC7c6aNpNTBPPjOxW1JzOP/a8ShbtVU7OeP728PkOez7B72EHe59kD
wnSFynJh138UEenz6iZZBr7FOlSqxWsxNUrsGjDd8VTsTkAeJ9/gkKwtjKwlWPdewChOVfdBTPoI
usPRjs5G3lsuYKIR8L3W6Nd9FG/IlkE6fbW3IKCvn64E6DxhpZFRvHVUTD7avsM74tu2wdLRxi11
uro0U2OqH7axzVKxBLp3kmRlftb9ztGpu/Uu2QGnttvgh0mUmMm9jOPAIi67Xel5Vk+oZErERsAn
TfNveAPMlyivo6vpfN+SZCG593yfrL33QvoM+E6x1j7ZeqHXpKE1clVdV55PQmVU1oW0W9NmLC3J
q70ZfxNtKuubZfQYM2tzUqmWGAOpG57m1pSE9GjPDnaTUvKJ3oTxLuGPBGOTUboNy5Dk2zRfViy7
gDRbDbzKAVFiK1HscRtSCkp23m19ykLsDsfWdIbUxNuOfVout0StUaqZh4/PX987d5QML4KtbkeT
vZhYjmg8sYnJjtKrufnINvZfrbRc+vFsD7NwSm3vjZPqjRi7H0zcT/uHLEgSb4q31fb07muXYJwv
nyrliHIq+M+v3758+vB/L3h0puQLS81X9BgTstFDCy1RUMb9JCC5l0GWBEshwwKXHv/tCra+E90l
ydYBchZtY9/ZdAXTe9WSrpTCo22tl0Rd4A2OT0Asdny7wkJXEwENYtIYWCfyQ0f/PHW+p0sYS3RI
A480MNOJIs9ztH5IN06sHArIGMk1dNs50HSzkYnn7hcUk2OHCaw1efwffeIh9aaNyIUFK1i4Nm9d
Ofncb2SrDymIpj9aUWWStDKGUhxd2J3YTtuL9TUd+JFj1Yhu54eDq21tYkTCpcdnKELPb+mn3dr8
LP3Mh17cUAcCFuEePlcL/UAxsSV3+/qijnoPr18+f4Mst9CCyqj16zfQ+Z9ff3346evzN1BbPnx7
+fnhtwXp3Aw8TJXd3kt2msw9J8eG4YqB997O+w/xbTdUX51zcuz7a7lifzlb1Q0MLCfFfqjPe6fi
/v3vA2wJoI9+e/3w/FH/UK36rB2o2PHqSHnmxWmQZXr9OKHiyGhTlSSbbWB+3pSsCSLTlVS//7v8
K2ORDsHGt7tNJTtsqFS9XehTswyxtwWMYhibRU7JlPmh+ubo6G8CaviAqVIs5zpjjKV/y7Sjj28X
c2JtItmF4r7qkQ67roPpeUmsD5rai2NjdvVc+sPSX7SinLlF5mtbwB2aximkWhWQ1tdTVja7G7JG
3BqeKZkyY7vPB8+ep8ttWlUpYRc06DIZWl+FUbWY3YqpH7c+OaG7h5/+2qqTDYgxK4wEYVefwZcG
W3v4p2TXlFezN7RWJ6x++okrggWo9gltZn3vCdJMSF0bD11sd2oXRoGehKsujKx5k4k9jgnpTnaJ
p8ZIiv0Wk8nUxkrd2ZN5+qpET+WpNUtxFYbx1h4GEN0Dj3q6cIM3vh7BQHVD5sMeipfktXtEZr2A
nHvpzPmdjBSXdWLO/OlzA59MtQZl4ltbq37WSai++vL67f0DA+Xyw7vnz788fnl9ef780N0XxC+p
2pqyrnc2EmZN4HnGkq3bSHksMlqDybQVHKL7FBQ+3/jcIs+6MDTLn1Mjs4Iih23OyYVxRXk7vSR2
SqIgoNLG6eZdK39G+g1l3HarQ3345CZFZv8Nj9mRnrfmmZ/QDC/wpFabvkX/7b9sQpeikwHXCCnR
YBPe5Jirccei7Icvnz9+n0W9X5qi0CfLdGhs7UTwdcCh7f3xDu7sJSR5ejWfuWr8D799eZ3kFL1a
YJrhbri8saZLtT+STulvoDFbIK0JrGmtUunjMITxTciGDC10Q83lPCUaGzpq6NYCL3KZ5AWtad1w
8o2RKrLbg54S2iwmjqP/mFWJIYi8qHcLcKjxBLR7Q1XZYaeZLGPasW5PMmTWOpNp3QWUSafKxAte
8dtByWTNc3+H/BOvIi8I/J+X1lWEpdGVP3s7pwTZaAdDLqVFFdp9+fLxKwbmhrn48vHLHw+fX/7t
4pnZqSwv44Gw57NNO1Th+evzH+/xzTURVZzllB1Yn7ORtQtTtzlBmbHkzUnZgd0P1gCUZ9Fh4Oaa
MvnI2uUG3ZbqmmnM9oJKlQszQUzNGmCcg4qHoUW9V5iKYCF5cZjD3i+wx1LiWDfL6CzX9MP+ChHF
QYWl7Maubuqizi9jy5cBdJHuoAwal56yLLDueTuZZcHOasMFZyowu5xin2kFFDXLRlCOs/Eg2vLM
lhbIc4doBguYlvNyVH6IiK/CD3ZhmE8e0S6LQiWMaHbbH4L0epn7AIySPhXFXOgeJT2CABbrHY/p
UhRaSMFrejU06rRvlwwrYKTdL681aBJT2tI+NFY9Upc8Y8uylqSLNQ60Lcu4w8kdwqzMYD044ao+
9Zy5cbHzSdYOUJ9zY9X0MJIar8O08pwf6Bf+anxLFrlOMLD1kj7tUasxZ3lAs2PslpTB5noej5n+
gOaGFX1GO/RDiqeB9m2G2L5Oj9QFCGINq/jNi1z24esfH5+/PzTPn18+6rz5SjqyfTdePJAABy/e
UpZaC1LsTd5KWNIF1zt+JpAnOb71PGANZdREYwXKTbSLza+fiPc1H48C3+sF2x3lDFMn7Xrf888n
mDBFTNWNvUlXNB3gr1bAC5Gx8TELo87XvRjcaQ5cDKLCaCr+KMpgzxxv/7QcF/RheLiA8BVsMhHE
LPQcyswtlyhExx/hnx39toGgFLsk8VOqV0RV1QXsDY233b1NGUXyJhNj0UELS+7pJ913mkdR5ZmQ
DTq6fMy83TbzNuQgcJZhk4ruEco6hv4mPtO9uaCESo8ZKGKklHAfRVbKE3Rmke08/RJ5USjAe9Cd
n2itX6PLN9HWMdIVPmIpEtB5j4XjVfWCuO4Zfoia6473PSR1HG9Jy0iSeOf55KwvWdWJYSwLdvCi
7Zkvb/vvVHUhSj6MRZrhf6sTzOOapGuFxAhrx7Hu0E3UjpwwtczwD6yDLoiS7RiFnWPlwd9M1pVI
x74ffO/ghZvKyS+nLI6ngnT5LbtkAlhCW8Zbf0fqdhRtEtCzvK2rfT22e1gLWeiYYtdpKOPMj7P1
b7nT8vDIAqrKBUkcvvGGpY2fg6ok226QmD5K3IQZ6Z6cpE8S5sF2LjdRwA8eOdOW1Iz9qA/rA5Tz
gz7k4rEeN+G5P/g5WSNIvc1YPMF0bH05eL6jzolMeuG232Zn8j6ToN6EnV9wx7eKDmYMrD7ZbbfO
ejUix+k8TZ3sqIDqC2K0V2bpsAk27LEhWzhTRHHEHkuKosvQCBsm/FkeXVO+a9Dm3AuSDljDj9jh
TLwJy46zv0Tc5P4P2WbXnorLLE5sx/PTkNMeIO45eiFB76gHXO+7gNZAb8TADxsOE3JoGi+K0mCr
qaWGFLXMvm9FlhvKxyyyXBFNELsr0fvXD7/+bkrdaVZJpd4Z45AeYVagoxpUGkLyQgO1nnmDhqRK
RcnUB7yAIpABFt0u9v017DQYsgTKVqP9yAJFYJ4zDI+IrvWzZkAnBjkf90nk9eF4OLul/nNxU2Yd
n4M6TdNV4Sa2GB5qHGMjk1iPCWWApAWhUtoErjSRxIE14yF55wXkcc6MBqEh+Uzi5XXANag7igqD
e6dxCF3oe4GRtavlUezZbG8eB6voet6t+SUGTt7HWWRLM2mFwiZ8aIyAijMgqziC0SOdaFzzNpkf
SC1msNKp1BNU4HKsGuJws4Juk2FwoFljtknLGNPnjrO+jDbekbkIFoB9fKCWZnnMmiTaGJLYXcez
E0d2xFPtTNQ0nM5LymA1Np9YZuZdxXrR6yXOibbne9U1bdrkJ2vxDvKwdy7RVLQtqHNPvKTcT6Lj
BqQ6DkkYbRe34VcAtZIg0G4QllBIRntaUmyWV7NXoBSwD4VPnY20vGGNEQd7hmAzjchpuiDYhlFr
9k+/rwdlxObsowLZ38Ux0fgwvfnGZ/1cdpLaJkDixper6gHo00m0j9LgvAIfn1eZctQ8Wfq9Pn96
efjnn7/99vL6kJlnN4f9mJYZxg281wZp6kn+ZZl0r+Z6hKYO1LRcKfw5iKJoYTdZ0E9AWjcXyMUs
AFT6nO9BNdUQeZF0WQiQZSGwLOvW8diquuUir0ZeZYIMB3mtUXsuesAntwdQLng2LkNVQ/qepY+F
yI962zDM+3zspwXZBAiPQLBhMIVst+LaGL1/fv3138+vL9QROXaZWmbkDAO0KelDBsx4AT3JcR0A
MCx5o9P6nPm0tycATz2XtEyF02fjUIPxlDinlFgAahCp8IGvNJoh/Ux5O3JWBktOOJvSit6Jia3j
VSRgBU9AQaadB+FIMxC8nU1aOeHEnu4ufuAsGVAXJGl1ABHWu+J+Iiqc86V391zFa1hNgnZyAfjj
xRE+F7Awc5ygYpV1ndW1c370HchZzg/tQGoCBujsvPbRvTKchaasLYEDuuCcw7Km5ywGuMuHbhPp
1iSqY5UjRjpbyVFtq0tuZMILZDpkE46iRAOHrbk6yq3p/eVqe00xfsVM9s/v/vXxw+/vvz387aFI
s6unDMsnBp7/pAWTGLS4F+lCWEWk2IAuHmyCTjc7VVApYdfND+QlqyLo+jDynnq9xEkEGOzEcGl0
gYmghgabUk/r8zzYhAHb6MnXt+1mG1kpw3h3yD2axc2fEXn+48GhhiPJJM44vrLuyhBEmsU2dds2
9H79buOPXRZEmiu5Ozb5ziUqvZNoHrruyXe35kSxKhz3aqnK4c+54BnVYsmOoEtRtbIMPcF5VCYF
bT26QVdP8utfavk01zoqDj2yTQrakZlAZI8GMo/h9nrx7VcP4p+o77g6klr9jtlDJjXcfRR424K6
Vb4T7bPY97ZkF7fpkFYV3cWzr1tyfi9awDOSxfyAkVzbomRiQzaaIaUI3X6BOqZ5W8LfozqABtGq
ckSHuNNYAotNkhanLgC1euEtyLrLv2aT9alahlTDnyM6XTE9XuvI2IDMWjBBxjHXCqyUw+vlbTom
NWlpJYy8WKy5a6Lg6S5K9HRoBd6ia82r0PHPwFsE6Uap4gBdTsBFMjDRUy6qtczThxi1HluV7Mjm
cnWj2ssG3JYz+Y8wWKZfHWPVRaa7P1LtaOt0PBgl9bzd15Ir8CDNFt5RUXWUGbdq6OxQScs5WTbM
+cmZee2aoT1VtkeeBVHaFWPP8EpRt31Q1WBoo3x/Opj1S/SMVKWuiHeYlfJlssCFJGMcqlYLszqW
+UlC21sruJAbz3EtrnApjg534QruhBhoLnSHlXpVuolOSeI4GL7CjjhIVzhcgc+0XoXYvjNMjTU0
ZZ7vkDEUXApX4Be1nIdLzh0RYyvlRj5wGBjPcOxQnCY4ila+eQpXZTmd0Wm64eBufcbagq10eq6C
lzrhgl1Ws0/FO+KUXot3w1Pxbhy2HFo5mhiqG+PpsQ5z97qrMpG7u3SCV/p8Isje/LAE98hfi3BT
8Er6ocPA/o67p96hTDw3eswcMscVdC9zkJf97cqoKQ/9yeBu+ZXAXcVj3eZ+4HCqqWZOXbhHvxji
Tbzhbr4LezFzuFFDuCqDyM0vmnQ4ull+K5pOZO7tqC254534jO7cNSs0cueWPHZPp16wJFhhRTP+
AxavlOpaupdGPwQOw19EL+XB4LVKHT5mf1duSLTAsmoesmmykLLvLdf/GFlA/FNmiqMUb/k/Am+T
GP20sg/KmnKBhMigAl9N7RWZrasfhRY6GH6C/N51vL2Msmt5lXd0kDQgbBl973bCiuzWYNGwJ/FW
RYGbTL//eHmHtuaYgTi1xBxsg3YiriaMLG1P9OxQqKmZ6ugJe9wJ73nxKOgtFGE0sW3pI7cJFvBr
Ba9PRuQYDS5ZCpPBnR2k0kw88gvNLVQF6lWnG77AfJPu7DC6eV21wiGjIglH81366amCCw5qvxt+
C813ojkv96KlTdgUfmjdRedF3YracdiNBL0AsTmjlxPi0DJlE+QmuLi75cyKrqZ3qalufla2Su7m
X1ol0DsJRMocvFqhnRt7w/aO4JaIdmdRHZm73kfYvAVwhJWmFak7mrbCzRMBDavqnubRCq5zscoL
1KlzCePu/v4SxqZdaX7JLiocrJOg5dPCcJcg0B90faD3aUVRo9fNlbkPangn1udf5QghiRiouZw+
zVaMg1V4cwsrxD0QDe9YcancfLUB3obnNk68YJUyMErdaxA0Z1DWnbBkYu0zZtMuN95wjteTKyV0
nLlZCKC8kLBXOeQxRXOqmmKFy7Sle5ByNDYE5da9GGUJwt6b+rJaRSdWFgxwIclX1htajeTuLuiO
7Ul2JZMuT+JIdEIpYGwcN0yKHQpR1issaRBV6f6Gt7ytV3vg7SUDGWBlQUpgWhgU6ERbIChBoDAj
3l89yBDyye0Fhi5O3QpE6w5DANLeSWjZbkLhIvEqL6E/+PqYihFvfws+30HfT3kQJ/zVYzJwWbzx
opcHEpyKRox7R7ciAfy3coXwRpy16XE8Mjke08yo3ZFjOhtSPYVE+KkLme+W3rz//vXDO+jz4vk7
/dyrqhtV4JByQT9iQxTbbgUMufX3Sk1GMSzLOc3Lu0uz5sm/hiGbnmIRHVKWetTUcyv5EwhUZmw4
HbcfGNyVAHSnfHKph1CuMg2xVJjJUfPkq/n45eu3h/T+0i4jfHqXqfNAEjGZHZfx1W9JI/r4TlOQ
N2vdwOFO4YxifKMw4yHbRRTdYXEEfgfqA8xXJlnlAtVu4QK7ne7ZaAlm57SURzJQw40MhbVKd7F9
Bw/4Lxmo7E5TimLP2anTG3jey8wssxOHEjK5SmuE2ffpfus4+kS0V2EWSjKwMOInaJ+IYaZ7+pin
T9Y0OMonq7GzReDayJfk2fq9awYQGelRLZcB9RaTqIyjZfRI0GE6kT4uIwlMKbfD+9lp2Kcvr9/l
tw/v/kX56p6znCrJDhxkRIyJSGX9K0vsWpgay5Lm0DeiN0rcrMYwoSWpG2Eb7ainKhU/42axuPrA
X9Mls3ahdksdLfnYJlECLEiIdWuVsW/xYrACTjAez/iStMp1CWVyhsczu5tV/luQ8E9GwawKvSDa
0fLURHEOPN9xI6+alpZxSHrpusPLW7Ppg+fIjUZPtZ6H7gMoL3yKgBd+FHi66xMFqCt6z6hEJQZU
Ymhnj3VX2bfkHWltrOApKJpRVMW7jWYVq1LPLfG5GMIsIt1BKHiOhaM1CINDb6zZgclkUKsZjbxl
gNdrYqQi2mGACLM3AFu+yL8nWv0GiUuz6DkxiTw7u7rLtxIT3cPhvV8iZ7cjHIfmB4E46wcb6SWR
AaBphtlht5hKzlmbBYlnTZ0ujPRwg9M0mKL/uYrqUoYBtKxsXZFGO99xRjsVPEdtXKUwoymac133
Y6CS645+FatAIUP/UIT+zuzgGQjUVDLYjXI88c+PHz7/6yf/ZyUltvn+YT60+PMzvm8mdIKHn+7q
1M8Gw9qjEloa88WMpj71QTHAcFrdi8F23R0HKvY22TunGLqx3F86blQ1xVy/LhprFSK3oN013nDD
d7NW+D2O2613u9cPv/9uc3PUUXLD5nUJjC4zAI2ohu3kWHfmN87okYNUDPLT/zP2bM1t4zr/FU+f
zplpv40d23G+mT5QlGRro1t0sZ28aNzETT2b2BnbmdOeX38AUhdeILcP26wBkOIVBEAQ6MN3Hrl9
jeAp5ZiukTAOmnhQPPTWYapSNJXr+QzOzkpXZ8Uo7t7PGMLnNDjLoewWZLw9f9+9nvHB/WH/ffcy
+BeO+HlzfNme/62KFvrIZizOgz6XSL3/Is/X7+lSZlg1KSI4VrRMUUYNePNgbox2kMXzhhYnFYrA
wdfJD8qNwuafj3ccitPhdTs4vW+3Tz/UfE09FIoCD//GIJjGlBztAXsGlSBB/5OcZ6USmEOgrIxj
WcHRuV4HAKcdT2fDmY2xJC8ELjjIyg+UFw1iAVMkC67XUwMbR8FPx/PT1SeVwEwWDqB4KQNgyAwj
BUxl8zpE2bdIGMSFj19QXWZaOPrLEGAZMETrVgOvysATITzIJSYamy1p/RUNKthSS1hsSinyooFh
jjN59PJrCuMlj7cUfD27Wut9E3CRZFw9nRqMm6Pnbc+8NQQ3Y/tTAJ/ejOxPLR6i2WRKtNl0MWzg
cLBOjYiFCgp9Oi8Oev+5rFCIDMd2k5r8qValWT7h13Ta65oiyMPh6IrojkSMiJGpMUQ71gCfUO1I
uT+bjCh5R6PAsMHW5wTmWg8orOGmtKah0fQk0mmHdjwsZrTQ1JAQqettmvvrEW0Gb7dWnVH090S3
ZGjMdmLbZLr2nHPMmUv7gTU0OSg0t1dk2tmawo+uh6p21NYOG9NIWd9hJj2OTmrh32wDLwLl8tIu
yJZAQC92wPS4TnQksxmZNqQdGBe4yKw94tLgMs/DdXNLrFkBp5nN9RWxpQR8QtOPCR4k4Dc0XA1J
rvGm4ZSYztsbLVlyO1FjmMtejjKmVHedDxKdhI04Go6o0eLpza3Re/FyU7piqLOBKY1+exK5OejY
I2p0EF4tVoYorjfwt4vvlhOdk5i2bms8MdTt1zY95uYM2s/b5V7wKMnJlTKaTXtOwEnPmy6VZHKZ
E+JxOJtUPouCkHoFqdDdjMkxHo2vxkS72S3J3fPibnhTMOo8Hc8K4VFDcOsZqNW/YeizYnKZB0Z5
NB2NL/ML5348IwPPtBObTrjYQFZRXA+XODiRWb7GPD7E91FKTXGd/9iSzQ77L6g5XV5OtW3cGme/
gP+7GhJcoza4WbtVvPUjEMX0+pZgStnN9RXJS4RFz+oMavu5TNtxsUPzJHT9IF+og+9GTIrhuVUt
oJzSt1OX5g8xx2es+nOBlYBT92uyHuOjAKmiZOnVr3LJNVWTNXH7euKESSLQpHvuSY1utBpaua5j
RXQTjMEDQ65ctizc8fhmdtVZ8LqrWYkh+htEcwwtGQT4XEpzXyuG0zvyiRMQjpQnuinLxHuAVIQx
U8AynJBAfr0ywFkipmSig6URu4pAGWVqjI60DimWFC3u0ydjGConrBJfmzgVQ99qKxR9xnijW6X+
RAh+VjzwqYUEmFSsYy8OsnutBlgGXtQhtNpY300o5u/2Mp70OAiI7/Gg8QvspYm9gpZORQVZ2ePI
htjIn/Z4/aJXKPXYQUHrSdwlBGYzpgxCSzdV8xDBL7ywtSEirXMHXSR5UQVJETomMAtiPTWwgJpf
r9PUPR0Pp8P382Dx6317/LIcvIjc1YR/wuIh9foS2/ymlqZ588x7cEr90U/B5kGPP856NlUyBduc
sFmzkbSsqLwiSyKvLZubGDh30rwwHlW1qMIhLy7r40ptfA1C8a6/AJyqUT6nivU55jb4ML1ULXCV
QltlAnHnCF+5zjp5oYYmHuubiRAFHZbZmKVDDoAwCvn0Xmp7K/xpDHcak0bYhswPlLmTupcOo8gL
Q4axlJoZp10dysxnXFkWREMW+DyRh8q9LvwQ0V6T5K5MlXeENSF6XwPbV9h3nXJcVtJ1pIW2lg96
tDS62zGZTlQhaowlNiYPJtfjYS9qMqSajCg1Q6OOGfdibq7I2rjLvRs1iKyBk0+DCZwIIw0ilbYW
AFGswulVTxAFpXy6oh5DKgRLTn/YcW+GM3HBQ1XrB2vYWlFEejchQTiPKj4vlWWygk0eh4nwFJDc
9PXw9M8gP3wcn7a2OCjuLeBk72qQENjsjqctyjwDvjOTT7Y7qLcsCKgTugQUa8C+KD4M6BSA0bKq
NCimY0d9tUq2uy3IgtBJtGFrGXe0oGPnppzibiwsvIxVkVFb/QHLmNvIdTBHpWJDlzGzt3vMazAQ
yEG6edmKm5BBrpxtzZPc35AqRn7xJYLfSeP39u1w3mL+bULS99CdsbZyd9pDC4UN4dHHK1Gr/Nr7
2+mF+FB93qg/Ba83YbHGaiVMvLif490jAiiNT5DVMo4SGUpvTKuP4EvlVZC1wdphAe2fV7vjVgkN
JBEJH/wr/3U6b98GyX7Af+ze/413LE+77zAxru7wx95eDy8Azg9c8/RrQkETaBmI4njYPD8d3voK
knhBEK/Tv/zjdnt62sC6uD8cg/u+Sn5HKq/l/i9a91Vg4QTS24slGe7OW4l1PnaveI/XDpLt+RIU
nnqLjT/xyQ96aRZZEoZ1OKr6u3/+BdGg+4/NK4xV72CS+G5hoNdZs1XXu9fd/qdVUSMHBrAe18Cz
S3J7UIXbS7s/WlWdJIlipp95903D6p+D+QEI9wd1cGsUaO7LJsReErtexGJNs1TJQIBGlshiTkZ7
VinxMUQOMoYSbUtB491+njLVAKKVZnkeLNs913TCNddH19/KW3qxcvvorQsuTH9y6f08Px329Y6l
nM8keeXnDCQWSvGuCcyYEzVYPHrDf6/HPe8Ba0IQiYbjyQ1l1OwormUmZ6IsiF23lI7fUeCllTp7
NSYt4smQzKFZE2TF7PbmWlHjangeTSaq9bgGN47GFj0gOKVpqOgC/r0mrXGgZyeZ5ksQ9HgPxAXt
1b4EtcnwfW7WykpRsOCHeY+LICtuAQJZEWGAVE7J/YgneivqWlHiAWL8PKz8IjILyEUU9jxMQArh
PEbNv0Tq9+cNzHQztdBNuB9tJISL1mxiVpgXUepZUkOQ3YucB/YjS8CgOKb4LkDXA67KZVZhZfKB
Q9z1TGfm5V6hngO/dIyT8SgvHPzF1WCNEivHer7SJRnEYNxN4aRk9TJdPIA89e0kmHHXxdqCg5k0
uq8owDoKq0R3Bhp8rADCNlZqd87hmCAiZkg20mvGGmvjcVUkWYZc741Cml9UcXngZRl136gRsXCZ
mDXg2g2i9Sy673nxIHu89kKl31r70jWrRrM4qhZ5wPV+tSjstvnliKXpIom9KnKj6bQncgYSJtwL
kwKtby5tbgGadq+hduRYvezQ9suEetnqq6GtG489tNOrLMyFkzWI//Y4JflH3NH0BO70+4UDzjCp
yIW5PeL91WYPZ9vbYb87H46a/atp8QUyZRew3rcxY+vLbP98POyetWQ+sZslPa+AGvL2yGeKcNc4
4ag/TR5dA9MINqnLFBNjHZWp8lATiRq5YbEanI+bp93+hbIHAi+jNDEx9cVC5c4NrHdmWgLzqYZN
YTwrN9FRXna96r5bBGR7rCcp3bsqu+tdeT+lQ0rmSohd+CGc5NF2FCeuZmlEnHwe1/dSSqFYlI5e
aw03354gCvhuZEAczw/8RAcmXAmfXXjtiwP4X0qOV8HttkNPfRB51+Lk6HLavr9uf2qvr1r6dcXc
+c3tiCnmBgnMh2PVhIVQXTZCSG2o6EzOxNcUsTZJNR6SG7FJGnAYRNIerQCkCsyLLNRXUsZl2HLV
blQiXBncAkqXzJVxyJvWt0YVkIHgdEiLMlPE+ihRs17hL2EIUPUyQ+6WEVx36IIouKeqk3DGF161
SjK3dnPsWlsHfPJgCeBFVa6e+QhKcoxMzZWzXsYH1mNYNbDKQaMWjDN1ROBtV4V4vIjopht4G7qc
P/TgoVI4OLOHtA5KpewXDHsVFNRR7+dm6GDXBAQSIJQm5WvMpLsvk4Kp3xUAvHUR5hCxBtCATJ2J
GM2rpl+xLNb6JcGWbHzvR0W1pF0cJI66qheV8UKZJVYWiZ+PK19ZxxKmhSbzofsagAOAuKTqseJj
MjSM3U8Yvfjm6YcW4jkXq1DluDUIb3t6roobikWQF8k863lh3VARjNugSBwUGKowMNNjNeZM2Wgp
AJy2H8+HwXfYUtaO6kK8dRIOgu4w8h65EhJxjaFNkQCmDC97kzgo9OdN0va3CEI386hI0bIwvjbG
p7M4gmVuVM3TUgjqyLNazJ2XxVpsOl0WAE3E+kkxAYlYs6LQWr0o57AvHJ/a/iBk+C7odR4rtHsR
/CNXpcLciMFXRLYgl+4M6Jbs9Txqgw0KDO+uj66hClVBKMwbn/mvn3anw2w2uf0y/KSiMZuEmLLx
tRYCV8PdXFOmCJ1ETVmgYWaTq96KZ+RrJoOkv+KbPsz0wienVMB7g2TUW/F1L2Z84ZO035NBRJuE
DCLaPUojur2mgnXqJJOrnn7c6qm4ddyYSt+iN/DGGoYgT3DdVZT7oVZ2OLqwUgBJnyFIJXxdeqpv
Pj/UO9yArd42CNohQ6WgXvio+Elf1X3T0+Ctjdgg+oa/7eM13Un1qlODG1vrLglmVUbASh0WMV6B
AqU+GG/AoFUXAafgIFeUWWJ2TeCyhBVBT2CdlughC8IwoKxlDcmceSH1bQwmcmeDA2grUwPHtoi4
VLMmaD0OqE6DqHuHTm0aoix8zePZDenDvowDnpjxippY46r4K++Ptk8fx935l+0Th9Gu1KMLf8Nx
eV96KGujtEDbQrwsB+kBpgdLoE8NffwUGO3EE7GfaIJaqCVIugZV7gLzEcj4TXrQWI+XKPuiF1Uu
rGxFFvCeaH41LaXq1CjNZIv8o2AO2lfyxEyEKzwchIdIDE0vhTdW+lCJUHPMkGEsMkpSB70BxfA8
KTP14gIlmoCLkhiMz0xiS6Lxwdfi66e/Tt92+78+Ttvj2+F5+0Wmj21P8eZRXDeCTDGYhXn09RPe
aT8f/rP//Gvztvn8etg8v+/2n0+b71to+O75Mz5kesFV9fnb+/dPcqHdbY/77avImrHdo4GgW3DK
u/3Bbr877zavu/9uEKuYdEEAxE6B8hQnahYUgUhiOcDKiz7NFlbT+LBxex79KfmkyXY06P5utHdn
5o5qJTlczknr0HD89X4+DJ4Ox22Xw7frrySGXs218MkaeGTDPeaSQJs0v+NBulCXjIGwiyyYcLS1
gTZppmpyHYwkbEVKq+G9LWF9jb9LU5v6Lk3tGngSEaTAkWF32/XWcLuArh3r1Ji5TbAJI01QTTX3
h6MZxgB/MxBxGYYWNQLtz6firwUWf4iVUBYLYKsWXKQQt9ZBENk1zMOyiQ5fh7rU8V48D7oU8+nH
t9fd05d/tr8GT2K5v2AM91/WKs9yZtXk2kvN43bTPe5qzt8tOHPJsNlN56KRNezA7pbeaDIZ3jZ7
lH2cf2z3593T5rx9Hnh70QnY04P/7M4/Bux0OjztBMrdnDdWr7gaIL4ZPwLGF3CYstFVmoQP9Qsg
szvMmwf5kAyW0XTIuw+WxOgsGDC/ZTMhjvBGQq5/spvrcGIguU87HkpkYa99Tqx0jzsWLMxWREeT
nsRl7XJ3aN9OgV0XOVEliAkYRaO/WLxoR97aMBgCrCgju0foKdAa/DenH32DCuKcNeGLiFFDvb7Y
uaUsVKedfNmetFuFdt/z6xHt1q1R2PFyCSpqNSAcZiE0Xg8bHVmTJ4UTsjtv5FjDIeG5vS8yXgyv
3MC3uZCo36RXZtFsd+RSylWLJIsEsHfEfeLF8cwi9+K+RLyaUqUDjyY2+wQw5tCxWPGCDSkgVQWA
J0PiuF+wa2vE8ujaJixASHKSuUVczLPhrc01Vyl+rt4JfPf+Q7vAaPlXTgwxQKuC0rMVfBzItWpv
zbh0ApvVsIyPiU85YbLCd0IXljxDd+jAPog4Q32nCd1h42yugdApwYnoi+Ea6cuT3BzeuwV7JGS6
nIU5I1ZKc5bYBTyPqMXLUs1/SYdXee6NqglxzOfR2F4fap6/BrZK/IDYqjWceIRkEBj5HeUiO7y9
H7enk6YftEPsh2g+NT8YPibEqpj1vPxrC9EPWTo0GYquRj/mhdvsi2yzfz68DeKPt2/bo3SbNfSb
dlXnQcXTLLb3n5s5c/EaxRaVEFMfKhSGYsYCQ53fiLCAfwcYKMRDr5f0wcKiDFxRakqDoJvQYltV
xOxyS0GpEyoSttwyJSa4pUEdqH+qWjIvFvJ64oBe7xUeUaN1FWNrQxjRxFTzXnffjhtQK4+Hj/Nu
TwgKmBBUckkCLnmajahPTiXMey8NiZPc4mJxSWLvJ0S18vLlGjqxmqrF9eyTH+HNaQ7KAcbnH14i
ufT5C1J1179O+O6fWqTuOXMXK2KloAtDyly8r73ERZCsL3OhQiLdAYORLU12WI9z8tRp8Nj6qzEd
WUgh5pyOpq6Q3LMCFLTZ7eQnvygdNbS8NzGoSTgd/RHd+A/raxq5pOPmU838Q1Jo6O8p5eXw76gw
iuWaX5LH5bSAYEbPfoSx2nk1X4d9899R9AaUZflDhAkvgQwtqxhuV7kt75Bp6YQ1TV46Otl6cnVb
cQ8tlgFHpwnTYyK94/kM7/2XiMU6KIqb5gVvh5XMdHs8owc66NwnETrutHvZb84fx+3g6cf26Z/d
/kV90413mqqdOdP8C2x8jg+GO6uwxHvrImNqn2grcRK7LHsgvmbWB/wYnxjmrXmcvmf/g542X3eC
GD8tnCn8ZqjC3gMHk0izDLNPz3WpHN1ejfa0XwClAJ/tKlPd+JqCvhDz9KHysyQyrGEqSejFPdjY
K6qyCNR75gblB5ihKMhgsKAJ6p145qoXMxjb3qviMnIwuJ3inoemedUNt3WQFTGSI5baKAPcBt72
UQ2o/bcCtR+CAr1EYIuA/BYnRXsb0W5EDrsXRCgNNJzqFLauC40pykovZarlqI830QR6+IwggS3r
OQ905CKNhFaUBQHLVswUihABc0MXmmpaAtd/6ZEtA8e2XXS0SmSQ1rig+I5iHvWecahpHvH0Brks
1HwrHqUAYqgMoCugYiLytSgXH4/ISm04ivkd+ZsGVuhbxPoRwWr7JQTNqUTDa6Tw8E2pYgGbUlNW
Y1kWEWUAWixgt/SXy1PMM/7LgDr8b6K2niHvOl/NH1VnfAXhAGJEYsLHiJGI9aO9Z9XLtfbAyhMe
wE5cetDdTA2JgbsZdrnq9itBIkKFtvsR7moNiRg673WAGPTqKpeIUKRvMnCIgDqF4uAZXANxzHWz
qqimY43DIcbF9KSZB4trIXQv5ehayQAGGjmPNC88BKVeBkxRoCwt2t1+33y8njEu43n38nH4OA3e
5NXX5rjdwHnz3+3/K1oKprcEObyKMLxp3oXqaBE52sokUmUQKhqag9f2fRnQ9ap6UkHpRIxyT0US
FgbzOMJBm+lDglpevxtcM1mOF3NQqDMy0+g8lAtO62cK45zfYXARcUlJNQu9zbTV5d6rR1OYaC75
+PsSR4vD2resqT58xEvpDhBk96j8KJ+I0kALgAk/fFdZVolIuDMH2STTtgtsoWanLd08sfff3Cvw
vXXiu4x4jYJlKjWetoYoxNGtelwmaHmq3yS/adDZT/XQFCB02cwx9VVh7C0xDSumxiQQINdL1di1
6BYQz9uB/qr4SlsilH6P3YibAvp+3O3P/4jIZM9v29OL7U4hM9eK7mpClwRj9jEy8i78QVsEZmMK
QQQL28vSm16K+zLwiq/jdtZrUdqqYdy1QkTNqZvieiHrCV5UJwK+sH9Uisr09VRE4chJUInwsgwK
0K86sQb4r87cq05M72C35sHd6/bLefdWC8snQfok4Ud7auS3aquNBcMcVCX3jNepLbY5mHoS/yiU
OQiOtIymELkrlvm02XHuOhgDN0hJA1RtuopKtFYvPDXHgp/BGAsH66/Dq5Ey7bj4Uzgq8cUL6f2Z
ecwV1QKN2v8FwEHUhibDngopxVV2CRQjlIXRITViBVfORhMjmlclcfhgzoGfwKlR+WUsCwjODuzE
MfuXJsLV3J4mWcHKY3d4ApnhpTuV60/XjRYloWYH7vbbx8sL+oME+9P5+PG23Z/VdxyYKg01wOxe
YccdsHVKkbP49ernkKLCBFmqOmPj2nTTSuyrehRyYmRycZKtqktzCEToxyDoIny6caEedM0hKhJH
iODKd7CI1fL4m7JFNFpX6eQsBs0jDgo89FmoZUwXWHIy/2h69H6i47d6zySh6Er9VUst0lWmMHdk
sN66wIR9uuuRrAXxQmagHNWxbLKKNSOIsH0kASYu1K0IXX3/q+xaeuPGYfBfyXEPi6DtFsXu0TP2
jI3xjB0/4slpEKRBsSjaBkgC9OcvP1Ky9aCc7KmpSHP0oPgSRdHm1EqKCULX5NmQBYkd86wKznQO
B+u2zK7ykI9Hx2iR/7NsjxpNfY+4v3KtQH2Xvh43Fsl9Uh3NHGsPDBGzVmS917Sh41+ykLRI4hyy
0dSOW0QhyczcAItTLiI0SeT2GP/y7ZHP6MPEyBCn26iftnvyQvfaDAWrxm/rZrVCRAArCkbuuXM2
XLKHRkLCCu5D9jjANIanVQc8Zay13sEwUvfoX0oN6SxYK90uq315LLRbkw5H8Mrhts2O5FD8kx5Y
M7O2PMUHvFqlHCcIFNclYCyemkUgkfdWmBvwfgLhIiUC/iurbqmTAaSr5tfT859X9a+H769PonPK
+5/fXNsRlf6RwNh4vqfXjItqo3NOIkA2y0entCKOI0bs1IE2pOsw4w3NGOhZiG1GitZFbBMvEKSR
TS8/+Dmwwe8meAHASznSAgzkaqlI0w3ZEWRN5I0WxoQ0NBPg3xNcWwTJkiZ74OsrPyEVC38RHUGB
f2n0bUpus0JtyRdVaIfsi2U8FEWbKvln9m5XFMc2rtqPQTkq8I/np39/IhGMxvvj9eXx9yP98fjy
cH197b6m0thHufbsIMUvH7Ydip2a+4hqt5gGBrzSaYRcxqE4Jx7+NJvGVANbE25vEpkmQSLl0kzI
hF7r1dSn7k0JAg8tpdIFxT5bUdPCxRLJzJscgGvlYN05pE2B66+iz2efeBmQ673OzLbzPlPNpP/D
GZ4XPXReFR023mk28CRbUeTE+RKUVWS/mAJKOAqb8LuYa1/vX+6vYKc94MQj8tRwehLqplZr7Pdh
C19erYIncMT4uLDFRHZNN7bxc9CerEh0MxzrljzH4jSQWa6UPNuOmizRF5qQL6gnorUHXyxR8S0u
N+6c7zT/jpCg7dmLm5XFp48+GV5sdS8AWtz0KxUB/HFGW/LGWABd6tkf9K4kbVKLEh8KW3zFCWNR
62l7NzSOlcoZHQunxu/E4FVTBnWBgTk7muvQfZe1pY5jgyC7YJMowMtUDSVibpGZq6DlVQcNiFBR
iG7Qjny1nujhgCxAweVaXmRgsq8cEUF+Txj42xpqQnoBysgRgb0Ew5SubE3xRssoEHWbcbdzZ4uL
ZzG+dzCLBSZfyrzmGs2xQ8p4nf3kRlUjetaTCQkZxJg3woWDOcNhyoh0zCwzg6ucoumKBLe8zSjv
55G5L6aktn9PCPol6j4ZqWS77ZR+O/qfzY300MQGimmXE23ZNcqoWhEJHW9xLDv3EUf2J/JcvOfJ
AsDs4vhssyGNRdxmZsheMnKNHW43B7woFcwfqCmdI9cdFf5WFixs17HX93R/d6Llnr9Z5haZBfad
N80GZqKy86Q6UDBRLBqWAxB93y1gR+NY0lnNZyiYrvT6yXjwz9j13gW6BMJF0sA+Oec5bo9CdJWv
LO8MGenMVjGLFMIpZAV1LhXCwiIvavJT3FXm7VJxtA81IXxd7iwoJNYltOdgbVd5wU+Uf/zrn898
VhW68ov1l6Gy4hvhBC5rVJnYHQe42TT5/fcX1TThuaPuc6AilpoB/IRqSSFOkXX1nT1oGHsnhoui
5SbUz/LWLRrtfpWglW/2iQ/k7fLcv9xivKp6s6tHNSmcdd8shjTvBx3GsXQOHllLwEAlf17vD2f9
cYUF7h8yzIAxfSQz4yQir+YYhY934JD7h7NttnaWw5+yTbAC52VeG77ME0eJw8C75ewR1zPhLSVz
08bTVJ0w03Go39iZPtO6J3XD4/MLnBu49FvUI73/9ujccsaPu1KMG2wkU+mKwP29K23FmTddZIkL
lG2v5JMf1i/BiVjTGckciDErxPigYMZwBGdW1X2defFFtEm0OOWrBuTmq8gRlR1czXcQ0I4bmABe
BTf3x99BxjHeSZMM3i1LCcf1pH+bWyN3WvcRRFKYbK7RL0E8m6T5JSxxyAf97rxEiKBCe9ruaZRj
deLnWdIYye83i09C22ZFB21wEWcFzoknTd2gynpa+GCfQCOvE0NmBllECR0ngYwvn9U4A4+2LM44
AFiZDjlml5ujql1isPqtz3rcfiDAoJYiY/Cc+eg2bqohCD5z8ziGVQJd6JlThdJwLYLsY3TITuPi
AGmcMnhExoeSCbHCmwctDm4HjOjwj+CL22O084MZgaucKD4ghNudW/cOLchhLZF0YEuu2U2MhE3q
iJ5A4//uruqOU5bIEBB24HpQ+i6qBhKXdS7CVT25loIJqrwWwj7ISUUEx80gLSTnZtAGpLfHHGD1
Z6nTffRzsgaRhve3Bddy4Azl8Esy4bbkTGnXW+23iDNW8W/Sl0nzURYIIgO6I1HAg3ESOp2IJ4OO
q3o5qrMgaTb/AV88IpJ1+gEA
--===============6824671114972483524==--

